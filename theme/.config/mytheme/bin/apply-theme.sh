#!/usr/bin/env bash
# Renderiza las plantillas con la paleta actual y reparte cada fichero a su
# destino, recargando lo que haga falta. Sustituye a omarchy-theme-set.
set -euo pipefail

THEME_DIR="$HOME/.config/mytheme"
BIN_DIR="$(dirname "$(readlink -f "$0")")"

echo "==> Renderizando plantillas"
"$BIN_DIR/render-theme.sh"

install_to() {
  local src="$THEME_DIR/$1" dest="$2"
  [[ -f $src ]] || { echo "    (sin $1, omitido)"; return 0; }
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "    $1 -> ${dest/#$HOME/\~}"
}

echo "==> Repartiendo"
install_to waybar.css     "$HOME/.config/waybar/style.css"
install_to fuzzel.ini     "$HOME/.config/fuzzel/fuzzel.ini"
install_to mako           "$HOME/.config/mako/config"
install_to hyprlock.conf  "$HOME/.config/hypr/hyprlock.conf"
install_to btop.theme     "$HOME/.config/btop/themes/mytheme.theme"
install_to neovim.lua     "$HOME/.config/nvim/lua/theme.lua"

# ── Zen Browser ───────────────────────────────────────────────────────────
# El perfil bueno lo dice installs.ini, no el Default=1 de profiles.ini:
# ese puede apuntar a un perfil que no usas.
zen_root="$HOME/.config/zen"
if [[ -f $zen_root/installs.ini && -f $THEME_DIR/zen-userChrome.css ]]; then
  zen_profile=$(sed -n 's/^Default=//p' "$zen_root/installs.ini" | head -1)
  if [[ -n $zen_profile && -d $zen_root/$zen_profile ]]; then
    mkdir -p "$zen_root/$zen_profile/chrome"
    cp "$THEME_DIR/zen-userChrome.css" "$zen_root/$zen_profile/chrome/userChrome.css"
    echo "    zen-userChrome.css -> perfil '$zen_profile'"

    # Zen no carga userChrome.css sin esta preferencia.
    zen_user_js="$zen_root/$zen_profile/user.js"
    zen_pref='user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);'
    if ! grep -qF 'legacyUserProfileCustomizations' "$zen_user_js" 2>/dev/null; then
      echo "$zen_pref" >> "$zen_user_js"
      echo "    user.js -> personalizacion habilitada (requiere reiniciar Zen)"
    fi
  fi
fi

echo "==> Recargando"
pkill -SIGUSR2 waybar 2>/dev/null && echo "    waybar" || true
makoctl reload        2>/dev/null && echo "    mako"   || true
hyprctl reload        >/dev/null 2>&1 && echo "    hyprland" || true
# Alacritty recarga su config sola al detectar el cambio.

echo "==> Listo"
