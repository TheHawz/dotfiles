function ff --description 'Buscar fichero con fzf y vista previa en bat'
    fzf --preview 'bat --style=numbers --color=always {}' $argv
end
