export ZSH="$HOME/.oh-my-zsh"

plugins=(
   git
   zsh-navigation-tools
   macos
   brew
   extract
   history
   sudo
   yarn
   1password
)

source $ZSH/oh-my-zsh.sh


# Aliases:
source ~/.aliases

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line


chpwd() {
    if [[ -d .venv ]]; then
        echo "source .venv/bin/activate"
        source .venv/bin/activate
    # elif [[ -n "$VIRTUAL_ENV" ]]; then
        # deactivate
    fi
}

# Add your custom completion directory to the function path
fpath=(~/.zsh/completions $fpath)

autoload -Uz compinit && compinit
eval "$(zoxide init zsh --cmd cd)"
eval "$(uv generate-shell-completion zsh)"
export PATH="$HOME/bin:$PATH"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
fi
