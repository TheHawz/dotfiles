# Entorno. Se carga también en shells no interactivas (ssh, scripts), así que
# aquí solo variables: nada que imprima ni que dependa de un terminal.

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim

# man con colores vía bat
if command -q bat
    set -gx BAT_THEME ansi
    set -gx MANROFFOPT -c
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

# fish_add_path es idempotente: no duplica ni reordena si ya está.
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/bin
