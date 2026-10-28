# Bash ya no es la shell principal (eso es fish), pero sigue siendo la shell de
# rescate: si fish se rompe o entro por ssh a pelo, aquí tiene que haber algo
# usable. Deliberadamente mínimo y sin dependencias externas.

# Si no es interactiva, no hacer nada. Dejar esto arriba.
[[ $- != *i* ]] && return

# ── Historial ─────────────────────────────────────────────────────────────
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="$HISTSIZE"

# ── Teclas ────────────────────────────────────────────────────────────────
# Arriba/abajo buscan por prefijo, igual que en fish. history-search-backward
# filtra por lo ya escrito; el reverse-search-history por defecto no.
bind '"\e[A": history-search-backward' 2>/dev/null
bind '"\e[B": history-search-forward' 2>/dev/null

# ── Completado ────────────────────────────────────────────────────────────
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# ── Entorno ───────────────────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

# ── Lo mínimo para no sentirme en una máquina ajena ───────────────────────
command -v eza >/dev/null && alias ls='eza -lh --group-directories-first --icons=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'

# mise sin activar: shims en PATH, suficiente para la shell de rescate.
[[ -d $HOME/.local/share/mise/shims ]] && export PATH="$HOME/.local/share/mise/shims:$PATH"

command -v starship >/dev/null && eval "$(starship init bash)"
