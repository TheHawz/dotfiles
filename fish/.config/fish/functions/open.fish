function open --description 'Abre con la app del sistema, desenganchado del terminal'
    if test (uname) = Darwin
        command open $argv
    else
        xdg-open $argv >/dev/null 2>&1 &
        disown
    end
end
