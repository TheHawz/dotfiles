# Atajos de Zellij

Nota sobre los sub-modos del menú (`Ctrl+g`): `pane`, `tab` y `session`
vuelven a `locked` automáticamente tras cada acción (son de "un solo golpe").
`resize`, `move`, `scroll` y `search` en cambio se quedan abiertos para que
puedas pulsar la misma tecla varias veces seguidas; sal de ellos con `g` o
`Esc`.

## Acceso rápido Alt (disponible siempre, incluso en locked)
- `Alt h/j/k/l` — Navegar paneles
- `Alt H/J/K/L` — Mover panel
- `Alt [ / Alt ]` — Tab anterior/siguiente
- `Alt 1-9` — Saltar a tab
- `Alt Enter` — Nuevo panel
- `Alt z` — Fullscreen/normal
- `Alt Space` — Toggle flotante
- `Alt = / Alt -` — Aumentar/disminuir tamaño
- `Alt ?` — Esta ayuda

Ghostty traduce `Option+←/→` a `ESC b` / `ESC f`, o sea `Alt+b` y `Alt+f`.
Zellij no puede distinguirlos del salto de palabra de zsh, así que esas dos
teclas se quedan libres a propósito y no hay `Alt+←/→` para mover el foco
(usa `Alt+h/l`). `Alt+↑/↓` sí funcionan: Ghostty no los reescribe.

## Menú (Ctrl+g)
- `g` / `Esc` — Volver a bloqueado
- `p` — Modo panel
- `t` — Modo tab
- `r` — Modo redimensión
- `m` — Modo mover
- `s` — Modo scroll
- `o` — Modo sesión
- `?` — Ayuda

## Modo panel (p) — un solo golpe, vuelve a locked
- `hjkl` / flechas — Navegar
- `n` — Nuevo, `d` — Abajo, `r` — Derecha
- `x` — Cerrar, `f` — Fullscreen
- `w` — Mostrar/ocultar la capa de paneles flotantes (todos a la vez)
- `e` — Anclar/flotar el panel actual (embed ↔ floating)
- `z` — Toggle marcos, `c` — Renombrar
- `Esc` / `g` — Volver a bloqueado

## Modo tab (t) — un solo golpe, vuelve a locked
- `hl` / flechas — Anterior/siguiente
- `n` — Nuevo, `x` — Cerrar, `r` — Renombrar
- `Tab` — Ir a la última tab usada
- `s` — Toggle sync (sincronizar entrada en todas las panes de la tab)
- `1-9` — Saltar a tab
- `Esc` / `g` — Volver a bloqueado

## Modo redimensión (r) — repetible, NO vuelve a locked sola
- `hjkl` / flechas — Aumentar tamaño (izq/abajo/arriba/der)
- `HJKL` (mayúsculas) — Disminuir tamaño (izq/abajo/arriba/der)
- `= / +` — Aumentar, `-` — Disminuir (paso genérico)
- `Esc` / `g` — Volver a bloqueado

## Modo mover (m) — repetible, NO vuelve a locked sola
- `hjkl` / flechas — Mover panel
- `Esc` / `g` — Volver a bloqueado

## Modo scroll (s) — repetible, NO vuelve a locked sola
- `jk` / flechas — Scroll, `d/u` — Media página
- `PageUp/PageDown` — Página
- `e` — Editar scrollback (abre $EDITOR)
- `/` — Buscar (entra en modo de escritura de búsqueda)
- `Esc` / `g` — Volver a bloqueado

## Modo búsqueda (/) — repetible, NO vuelve a locked sola
- `n / N` — Siguiente/anterior resultado
- `jk` — Navegar mientras buscas
- `Esc` / `g` — Volver a bloqueado

## Modo sesión (o) — un solo golpe, vuelve a locked
- `d` — Detach
- `w` — Session manager
- `c` — Configuración
- `p` — Plugin manager
- `q` — Salir (atención: zellij no pide confirmación, cierra el cliente al instante)
- `Esc` / `g` — Volver a bloqueado
