# Zellij keybindings

Zellij captures exactly one Ctrl key: `Ctrl+g`. Everything else falls through
to nvim and the shell.

About the sub-modes behind the menu (`Ctrl+g`): `pane`, `tab` and `session`
return to `locked` on their own after each action (one-shot). `resize`, `move`,
`scroll` and `search` stay open instead, so you can press the same key several
times in a row; leave them with `g` or `Esc`.

## Alt fast path (always live, locked included)
- `Alt h/j/k/l` — Move focus between panes
- `Alt H/J/K/L` — Move the pane itself
- `Shift ← / Shift →` — Previous/next tab
- `Alt 1-9` — Jump to tab
- `Alt Enter` — New pane
- `Alt z` — Zoom (fullscreen toggle)
- `Alt Space` — Toggle floating panes

Ghostty rewrites `Option+←/→` into `ESC b` / `ESC f`, which is to say `Alt+b`
and `Alt+f`. Zellij cannot tell those apart from zsh's word jumping, so both
keys are deliberately left unbound and there is no `Alt+←/→` for focus (use
`Alt+h/l`). `Alt+↑/↓` do work: Ghostty leaves those alone.

## Menu (Ctrl+g)
- `g` / `Esc` — Back to locked
- `p` — Pane mode
- `t` — Tab mode
- `r` — Resize mode
- `m` — Move mode
- `s` — Scroll mode
- `o` — Session mode
- `a` / `?` — This help

## Pane mode (p) — one-shot, returns to locked
- `hjkl` / arrows — Move focus
- `n` — New, `d` — New below, `r` — New right
- `x` — Close, `f` — Fullscreen
- `w` — Show/hide the floating layer (all floating panes at once)
- `e` — Embed/float the current pane (embed ↔ floating)
- `z` — Toggle frames, `c` — Rename
- `Esc` / `g` — Back to locked

## Tab mode (t) — one-shot, returns to locked
- `hl` / arrows — Previous/next
- `n` — New, `x` — Close, `r` — Rename
- `Tab` — Go to last used tab
- `s` — Toggle sync (mirror input to every pane in the tab)
- `1-9` — Jump to tab
- `Esc` / `g` — Back to locked

## Resize mode (r) — repeatable, does NOT exit on its own
- `hjkl` / arrows — Grow (left/down/up/right)
- `HJKL` (shifted) — Shrink (left/down/up/right)
- `= / +` — Grow, `-` — Shrink (generic step)
- `Esc` / `g` — Back to locked

## Move mode (m) — repeatable, does NOT exit on its own
- `hjkl` / arrows — Move the pane
- `Esc` / `g` — Back to locked

## Scroll mode (s) — repeatable, does NOT exit on its own
- `jk` / arrows — Scroll, `d/u` — Half page
- `PageUp/PageDown` — Full page
- `e` — Edit scrollback (opens $EDITOR)
- `/` — Search (drops into the search input)
- `Esc` / `g` — Back to locked

## Search mode (/) — repeatable, does NOT exit on its own
- `n / N` — Next/previous match
- `jk` — Scroll while searching
- `Esc` / `g` — Back to locked

## Session mode (o) — one-shot, returns to locked
- `d` — Detach
- `w` — Session manager
- `c` — Configuration
- `p` — Plugin manager
- `q` — Quit (careful: zellij asks for no confirmation, the client dies at once)
- `Esc` / `g` — Back to locked

Config lives in `~/.config/zellij/`. Keybindings and layout are read only when
a session is created — there is no reload command, so start a new session.
