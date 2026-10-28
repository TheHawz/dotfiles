#!/usr/bin/env bash
#
# Enlaza los dotfiles con GNU stow. Cada directorio de primer nivel del repo
# es un paquete de stow: su contenido replica la estructura de $HOME.
#
#   ./install.sh           enlaza lo que toca en esta plataforma
#   ./install.sh -n        simulacion: dice que haria y no toca nada
#   ./install.sh -D        desenlaza
#   ./install.sh fish git  solo esos paquetes
#
# Nada de ramas por plataforma: el repo lleva TODO y aqui se elige que se
# enlaza. Un paquete que no se stowea son unos KB de texto inerte que nada
# lee, asi que karabiner/ vive tranquilo en Linux y waybar/ en el Mac.
#
# Escrito para el bash 3.2 que trae macOS: sin arrays asociativos.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Paquetes ──────────────────────────────────────────────────────────────

# Las dos maquinas
BASE="bin btop fish gh git nvim ohmyposh sesh tmux workmux"

# Solo este PC: Arch + Hyprland
LINUX="bash foot fuzzel git-linux hypr librewolf mako minimeters sharepicker systemd wallpapers waybar xdg"

# Solo el Mac del trabajo
MACOS="amethyst git-macos ideavim jgit karabiner kitty linearmouse work"

# Fuera de todos los conjuntos a proposito:
#   zsh/      config vieja de zsh. Escotilla hasta que fish este asentado en
#             el Mac; para volver a ella, `./install.sh zsh`.
#   ghostty/  muerto. El kitty.conf del Mac dice "Replaces Ghostty", y el
#             fichero se llama config.ghostty cuando ghostty lee "config",
#             asi que nunca se cargo. Se conserva por si se rescata.
#   zellij/   sin resolver: en el repo solo hay un config.kdl.bak, y el
#             config.kdl real de cada maquina no esta versionado.

# ── Plataforma ────────────────────────────────────────────────────────────

case "$(uname -s)" in
  Linux)  PLATFORM="linux"; PLATFORM_PKGS="$LINUX" ;;
  Darwin) PLATFORM="macos"; PLATFORM_PKGS="$MACOS" ;;
  *)      echo "Plataforma no contemplada: $(uname -s)" >&2; exit 1 ;;
esac

# ── Argumentos ────────────────────────────────────────────────────────────

STOW_FLAGS=""
ACTION="enlazar"

while [ $# -gt 0 ]; do
  case "$1" in
    -n|--dry-run) STOW_FLAGS="$STOW_FLAGS --no"; ACTION="simular"; shift ;;
    -D|--delete)  STOW_FLAGS="$STOW_FLAGS --delete"; ACTION="desenlazar"; shift ;;
    -h|--help)    awk 'NR>1 && /^#/ {sub(/^# ?/, ""); print; next} NR>1 {exit}' "$0"; exit 0 ;;
    -*)           echo "Opcion desconocida: $1" >&2; exit 1 ;;
    *)            break ;;
  esac
done

if [ $# -gt 0 ]; then
  PKGS="$*"
else
  PKGS="$BASE $PLATFORM_PKGS"
fi

# ── Enlaces rotos de una estructura anterior ─────────────────────────────
# El repo tuvo otro layout (ficheros en la raiz, stow .). Los enlaces de
# entonces apuntan a rutas que ya no existen. No se borran solos: se avisa.

rotos=""
for d in "$HOME" "$HOME/.config"; do
  [ -d "$d" ] || continue
  for link in "$d"/*; do
    if [ -L "$link" ] && [ ! -e "$link" ]; then
      case "$(readlink "$link")" in
        *dotfiles/*) rotos="$rotos  $link -> $(readlink "$link")
" ;;
      esac
    fi
  done
done

if [ -n "$rotos" ]; then
  echo "Enlaces rotos que apuntan al repo, sobrantes del layout anterior:"
  printf '%s' "$rotos"
  echo "Quitalos con 'unlink <ruta>' y vuelve a correr esto."
  echo
fi

# ── Al trabajo ────────────────────────────────────────────────────────────

echo "$ACTION en $PLATFORM: $PKGS"
echo
# shellcheck disable=SC2086
stow --dir "$DOTFILES" --target "$HOME" --verbose=1 $STOW_FLAGS $PKGS
