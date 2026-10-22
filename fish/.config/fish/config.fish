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

    set -g fish_greeting
end
