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
| **base** (ambas) | `bin` `btop` `fish` `gh` `git` `nvim` `ohmyposh` `sesh` `tmux` `workmux` |
| **linux** | `bash` `foot` `fuzzel` `git-linux` `hypr` `librewolf` `mako` `minimeters` `sharepicker` `systemd` `wallpapers` `waybar` `xdg` |
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

## El tema

**Kanso Ink**, y la paleta vive en un sitio: `kitty/.config/kitty/kanso-ink.conf`.
De ahí salen los colores de todo lo demás.

Hubo un motor de plantillas (`apply-theme.sh` sobre un `colors.toml`) que
renderizaba la paleta a una docena de aplicaciones. Se retiró, por dos
razones. La primera es que solo existía en Linux: en el Mac los colores ya
eran ficheros normales, así que el repo tenía dos modelos distintos para lo
mismo. La segunda es que **el repo no contenía la configuración**: `fuzzel/`
y `mako/` estaban vacíos y el CSS de waybar y el `hyprlock.conf` estaban en
`.gitignore`, por ser artefactos generados. Clonar en una máquina nueva no
daba lanzador, ni notificaciones, ni barra con estilo, ni pantalla de
bloqueo hasta correr el motor.

Ahora cada aplicación lleva sus colores como un fichero más, versionado:

| Aplicación | Fichero |
|---|---|
| foot | `foot/.config/foot/kanso-ink.ini` (vía `include`) |
| Hyprland | `hypr/.config/hypr/colors.lua` (vía `require`) |
| waybar | `waybar/.config/waybar/style.css` |
| fuzzel | `fuzzel/.config/fuzzel/fuzzel.ini` |
| mako | `mako/.config/mako/config` |
| hyprlock | `hypr/.config/hypr/hyprlock.conf` |
| btop | `btop/.config/btop/themes/kanso-ink.theme` |
| share picker | `sharepicker/.config/hyprland-preview-share-picker/kanso-ink.css` |
| MiniMeters | `minimeters/.config/MiniMeters/Themes/kanso-ink.ini` |
| LibreWolf / Zen | `librewolf/.config/librewolf/kanso-ink.css` |

El precio es que cambiar de tema son diez ficheros a mano en vez de uno. Es
un precio que sale a cuenta cuando se cambia de tema una vez al año.

El CSS del navegador es el único que no coloca stow: el perfil de Firefox
tiene un nombre aleatorio. Se copia a mano a
`~/.config/librewolf/librewolf/<perfil>/chrome/mytheme.css` y se engancha con
una línea `@import url("mytheme.css");` al principio de `userChrome.css`, que
es un fichero tuyo y no se sobrescribe.

## Hyprland (solo Linux)

Config propia en Lua, sin capas de terceros por encima. `hypr/.config/hypr/`
se divide en `monitors`, `input`, `looknfeel`, `bindings` y `autostart`.
Casi todo el arranque va por units de systemd de usuario (`systemd/`), no
desde `autostart.lua`, para que paren y arranquen con la sesión y se
reinicien si fallan.
