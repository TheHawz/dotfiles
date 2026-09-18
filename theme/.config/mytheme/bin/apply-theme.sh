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
install_to alacritty.toml "$THEME_DIR/alacritty.toml"      # alacritty.toml lo importa desde aquí
install_to waybar.css     "$HOME/.config/waybar/style.css"
install_to fuzzel.ini     "$HOME/.config/fuzzel/fuzzel.ini"
install_to mako           "$HOME/.config/mako/config"
install_to hyprlock.conf  "$HOME/.config/hypr/hyprlock.conf"
install_to hyprland.lua   "$HOME/.config/hypr/theme.lua"
install_to btop.theme     "$HOME/.config/btop/themes/mytheme.theme"
install_to neovim.lua     "$HOME/.config/nvim/lua/theme.lua"

echo "==> Recargando"
pkill -SIGUSR2 waybar 2>/dev/null && echo "    waybar" || true
makoctl reload        2>/dev/null && echo "    mako"   || true
hyprctl reload        >/dev/null 2>&1 && echo "    hyprland" || true
# Alacritty recarga su config sola al detectar el cambio.

echo "==> Listo"
