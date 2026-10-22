function sff --description 'Elegir un fichero reciente con fzf y mandarlo por scp'
    if test (count $argv) -eq 0
        echo "Uso: sff <destino>   (p. ej. sff host:/tmp/)" >&2
        return 1
    end

    # Más recientes primero; fd si está, find si no.
    set -l file
    if command -q fd
        set file (fd --type f --exec-batch ls -t | ff)
    else
        set file (find . -type f -printf '%T@\t%p\n' | sort -rn | cut -f2- | ff)
    end

    test -n "$file"; and scp $file $argv[1]
end
