# dotfiles

Configuración de mis dos máquinas: un PC con Arch + Hyprland y un Mac de
trabajo. **Un solo repo y una sola rama** para las dos.

## Cómo está montado

Cada directorio de primer nivel es un paquete de [GNU stow](https://www.gnu.org/software/stow/):
dentro, la estructura replica la de `$HOME`.

```
fish/.config/fish/config.fish   ->   ~/.config/fish/config.fish
tmux/.tmux.conf                 ->   ~/.tmux.conf
```

`install.sh` decide qué paquetes se enlazan en cada máquina:

| Conjunto | Paquetes |
|---|---|
| **base** (ambas) | `bin` `fish` `gh` `git` `nvim` `ohmyposh` `sesh` `tmux` `workmux` |
| **linux** | `bash` `foot` `fuzzel` `git-linux` `hypr` `mako` `systemd` `theme` `waybar` `xdg` |
| **macos** | `amethyst` `git-macos` `ideavim` `jgit` `karabiner` `kitty` `linearmouse` `work` |

No hay ramas por plataforma a propósito. Lo que se toca a diario es justo lo
común (fish, nvim, tmux, git), así que una costura ahí obligaría a portar a
mano cada cambio para siempre. Un paquete sin stowear son unos KB de texto
inerte que nada lee: `karabiner/` vive tranquilo en Linux y `waybar/` en el
Mac.

Un paquete entra en **base** solo si se usa de verdad en las dos máquinas.
El terminal, por ejemplo, no: aquí es foot y en el Mac kitty, así que `kitty`
es un paquete de macOS y no de base.

Tres paquetes quedan fuera de los tres conjuntos:

- `zsh/` — la config vieja de zsh, guardada como escotilla hasta que fish
  esté asentado en el Mac. Para volver a ella, `./install.sh zsh`.
- `ghostty/` — muerto. El `kitty.conf` del Mac dice *"Replaces Ghostty"*, y
  el fichero se llama `config.ghostty` cuando ghostty lee `config`, así que
  nunca llegó a cargarse. Se conserva por si se rescata.
- `zellij/` — sin resolver: en el repo solo hay un `config.kdl.bak`, y el
  `config.kdl` real de cada máquina no está versionado.

Y `gh/.config/gh/hosts.yml` está en `.gitignore`: la cuenta, el protocolo y
el host de gh son estado de cada máquina, no config compartible.

## Instalar

```sh
git clone --recurse-submodules https://github.com/TheHawz/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh -n     # simulación: dice qué haría
./install.sh
```

Si stow se queja de un conflicto es porque ahí hay un fichero real. Aparta el
que estorbe (`mv x x.pre-dotfiles.$(date +%Y%m%d)`) y repite; `install.sh`
nunca sobrescribe nada por su cuenta.

### Viniendo del layout anterior

El repo tuvo otra forma (ficheros en la raíz, `stow .`). Los enlaces de
entonces apuntan a rutas que ya no existen. `install.sh` los detecta y los
lista, pero no los borra: quítalos con `unlink` y vuelve a correrlo. En el
Mac hay que quitar además `~/.gitconfig`, porque la config de git pasó a la
ruta XDG (`~/.config/git/config`) y tener las dos es pedir una tarde de
depuración.

## La identidad de git

`git/` lleva lo compartido (aliases, defaults, LFS) y termina incluyendo
`~/.config/git/identity`, que aporta cada plataforma:

- `git-linux` → personal, sin excepciones.
- `git-macos` → la del trabajo por defecto, con la personal activada por
  directorio (`~/personal-repos/`, `~/dotfiles/`) y firma GPG.

## El tema (solo Linux)

`theme/` no es un paquete de config normal: es un generador. La fuente son
`theme/.config/mytheme/colors.toml` y las plantillas de
`theme/.config/mytheme/templates/`, y `apply-theme.sh` las renderiza sobre
foot, fuzzel, mako, waybar, hyprlock, btop, obsidian y demás.

**Los ficheros que genera están en `.gitignore`.** Si quieres cambiar un
color o un selector, se edita la plantilla; lo que edites en el artefacto
desaparece en el siguiente `apply-theme.sh`.

## Hyprland (solo Linux)

Config propia en Lua, sin capas de terceros por encima. `hypr/.config/hypr/`
se divide en `monitors`, `input`, `looknfeel`, `bindings` y `autostart`.
Casi todo el arranque va por units de systemd de usuario (`systemd/`), no
desde `autostart.lua`, para que paren y arranquen con la sesión y se
reinicien si fallan.
