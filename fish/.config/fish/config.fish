# Fish — shell principal en Linux y macOS.
#
# Orden de carga: fish ejecuta conf.d/*.fish (alfabético) ANTES de este fichero,
# y las funciones de functions/ se cargan solas cuando se invocan.
#
#   conf.d/00-env.fish      entorno (todas las shells, interactivas o no)
#   conf.d/10-aliases.fish  aliases
#   conf.d/20-tools.fish    mise, zoxide, fzf, completions
#   conf.d/30-venv.fish     activar .venv al entrar en un directorio
#   conf.d/50-linux.fish    solo Linux
#   conf.d/50-darwin.fish   solo macOS
#
# Aquí queda únicamente lo interactivo que debe ir al final: prompt y teclas.

if status is-interactive
    # Prompt: oh-my-posh con el tema zen; starship de reserva si no está.
    if command -q oh-my-posh
        oh-my-posh init fish --config $HOME/.config/ohmyposh/zen.toml | source
    else if command -q starship
        starship init fish | source
    end

    # Editar la línea actual en $EDITOR. Fish ya trae ALT+E; esto añade
    # CTRL+X CTRL+E, que es lo que tenía en zsh.
    bind \cx\ce edit_command_buffer

    # Arriba/abajo buscan en el historial por PREFIJO: escribo "tmux", pulso
    # arriba y recorro solo los comandos que empiezan por "tmux".
    #
    # Se declara en vez de confiar en el default de fish, que ha cambiado de
    # nombre entre versiones (up-or-search, luego up-line) y no es el mismo en
    # las dos maquinas. El precio es perder la navegacion por lineas en
    # comandos multilinea; para eso esta ALT+flechas y el CTRL+X CTRL+E de
    # arriba, que abre la linea entera en nvim.
    bind up   history-prefix-search-backward
    bind down history-prefix-search-forward

    set -g fish_greeting
end
