# Aliases. En fish un alias es una función, así que valen en scripts también.

if status is-interactive
    # ── Listados ──────────────────────────────────────────────────────────
    if command -q eza
        alias ls 'eza -lh --group-directories-first --icons=auto'
        alias lsa 'ls -a'
        alias lt 'eza --tree --level=2 --long --icons --git'
        alias lta 'lt -a'
    end

    # ── Navegación ────────────────────────────────────────────────────────
    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias .... 'cd ../../..'

    # ── Git ───────────────────────────────────────────────────────────────
    alias g git
    alias gcm 'git commit -m'
    alias gcam 'git commit -a -m'
    alias gcad 'git commit -a --amend'

    # ── tmux ──────────────────────────────────────────────────────────────
    alias tl 'tmux ls'
    alias tn 'tmux new -s'
    alias ta 'tmux attach -t'
    alias tk 'tmux kill-session -t'
    alias tka 'tmux kill-server'
    alias t 'tmux attach; or tmux new -s Work'

    # ── Herramientas ──────────────────────────────────────────────────────
    alias d docker
    alias c 'opencode --auto'
    alias cx 'printf "\033[2J\033[3J\033[H"; claude --permission-mode auto'
    alias cy 'codex --approve-for-me'
    alias mup 'MISE_MINIMUM_RELEASE_AGE=0 mise up'
end
