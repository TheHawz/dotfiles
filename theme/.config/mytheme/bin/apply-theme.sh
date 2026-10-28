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

# nvim no esta en esta lista a proposito: su config es un submodulo
# compartido con el Mac (kickstart), asi que escribir ahi ensuciaria ese
# repo. Fija kanso-ink por su cuenta, que es el tema que renderiza esta
# paleta, de modo que acaba en el mismo sitio sin acoplarse.

# ── Navegadores de la familia Firefox ─────────────────────────────────────
# Mismo mecanismo para Zen y LibreWolf: userChrome.css en el perfil. De las
# 16 variables de la plantilla solo 5 son de Zen (--zen-*); el resto son
# estandar (--lwt-*, --toolbar-*) y las respetan las dos.
#
# El tema se escribe en chrome/mytheme.css y se IMPORTA desde userChrome.css,
# en vez de sobrescribirlo: ese fichero es tuyo (ocultar pestanas, radios) y
# un cp lo borraria en cada aplicacion del tema.
install_firefox_theme() {
  local nombre="$1" root="$2"

  [[ -f $root/installs.ini && -f $THEME_DIR/zen-userChrome.css ]] || return 0

  # El perfil bueno lo dice installs.ini, no el Default=1 de profiles.ini:
  # ese puede apuntar a un perfil que no usas.
  local perfil
  perfil=$(sed -n 's/^Default=//p' "$root/installs.ini" | head -1)
  [[ -n $perfil && -d $root/$perfil ]] || return 0

  local chrome="$root/$perfil/chrome"
  mkdir -p "$chrome"
  cp "$THEME_DIR/zen-userChrome.css" "$chrome/mytheme.css"
  echo "    mytheme.css -> $nombre, perfil '$perfil'"

  # Engancharlo desde userChrome.css sin tocar lo que ya hubiera dentro.
  local uc="$chrome/userChrome.css"
  local import='@import url("mytheme.css");'
  if ! grep -qF 'mytheme.css' "$uc" 2>/dev/null; then
    # { echo; cat; } y no printf "$(cat)": asi se preservan los bytes del
    # fichero tal cual, incluido el salto de linea final.
    if [[ -s $uc ]]; then
      { echo "$import"; cat "$uc"; } >"$uc.tmp" && mv "$uc.tmp" "$uc"
    else
      echo "$import" >"$uc"
    fi
    echo "    userChrome.css -> importa mytheme.css"
  fi

  # Sin esta preferencia no se carga ningun userChrome.css.
  local user_js="$root/$perfil/user.js"
  if ! grep -qF 'legacyUserProfileCustomizations' "$user_js" 2>/dev/null; then
    echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >>"$user_js"
    echo "    user.js -> personalizacion habilitada (reinicia $nombre)"
  fi
}

install_firefox_theme "LibreWolf" "$HOME/.config/librewolf/librewolf"
install_firefox_theme "Zen"       "$HOME/.config/zen"

# ── MiniMeters ────────────────────────────────────────────────────────────
mm_themes="$HOME/.config/MiniMeters/Themes"
if [[ -d $mm_themes && -f $THEME_DIR/minimeters.ini ]]; then
  cp "$THEME_DIR/minimeters.ini" "$mm_themes/mytheme.ini"
  echo "    minimeters.ini -> ~/.config/MiniMeters/Themes/mytheme.ini"
  if ! grep -q 'string theme "mytheme"' "$HOME/.config/MiniMeters/settings.mms" 2>/dev/null; then
    echo "    (selecciona el tema 'mytheme' en MiniMeters: Settings > Theme)"
  fi
fi

echo "==> Recargando"
pkill -SIGUSR2 waybar 2>/dev/null && echo "    waybar" || true
makoctl reload        2>/dev/null && echo "    mako"   || true
hyprctl reload        >/dev/null 2>&1 && echo "    hyprland" || true
# Alacritty recarga su config sola al detectar el cambio.

echo "==> Listo"
