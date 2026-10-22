# Activa .venv al entrar en un directorio que la tenga. Equivale al chpwd()
# que tenía en zsh. Tiene que vivir aquí y no en functions/ porque un handler
# --on-variable hay que definirlo para que quede registrado.

function __venv_auto --on-variable PWD --description 'Activa .venv al entrar'
    if test -z "$VIRTUAL_ENV" -a -f .venv/bin/activate.fish
        source .venv/bin/activate.fish
    end
end
