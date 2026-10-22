# Integraciones de herramientas. Todas van dentro de `command -q` para que la
# misma config no reviente en una máquina donde falte alguna.

if status is-interactive
    command -q mise; and mise activate fish | source

    # zoxide toma el control de `cd`: aprende los directorios que visitas.
    command -q zoxide; and zoxide init fish --cmd cd | source

    command -q fzf; and fzf --fish | source

    # Completions generadas en caliente
    command -q uv; and uv generate-shell-completion fish | source
    command -q workmux; and workmux completions fish | source
else
    # Sin shell interactiva mise no "activa", pero sí deja los shims en PATH.
    command -q mise; and fish_add_path -g $HOME/.local/share/mise/shims
end
