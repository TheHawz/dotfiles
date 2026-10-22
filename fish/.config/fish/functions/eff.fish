function eff --description 'Elegir fichero con fzf y abrirlo en $EDITOR'
    set -l file (ff)
    test -n "$file"; and $EDITOR $file
end
