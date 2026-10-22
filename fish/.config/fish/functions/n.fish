function n --description 'nvim; sin argumentos abre el directorio actual'
    if test (count $argv) -eq 0
        command nvim .
    else
        command nvim $argv
    end
end
