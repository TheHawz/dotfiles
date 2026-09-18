-- Atajos. Núcleo curado de los 226 que traía Omarchy.
-- La lista completa está en dotfiles/rescate/keybindings-legible.txt
-- y el código original en dotfiles/rescate/omarchy-defaults/.

-- ── Ventanas ──────────────────────────────────────────────────────────────
o.bind("SUPER + W", "Cerrar ventana", hl.dsp.window.close())
o.bind("SUPER + J", "Alternar división", hl.dsp.layout("togglesplit"))
o.bind("SUPER + T", "Flotante / mosaico", hl.dsp.window.float({ action = "toggle" }))
o.bind("SUPER + F", "Pantalla completa", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("SUPER + ALT + F", "Ancho completo", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("SUPER + G", "Agrupar ventanas", hl.dsp.group.toggle())

o.bind("SUPER + LEFT", "Foco a la izquierda", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + RIGHT", "Foco a la derecha", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + UP", "Foco arriba", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + DOWN", "Foco abajo", hl.dsp.focus({ direction = "d" }))

o.bind("SUPER + SHIFT + LEFT", "Mover ventana a la izquierda", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + RIGHT", "Mover ventana a la derecha", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + UP", "Mover ventana arriba", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + DOWN", "Mover ventana abajo", hl.dsp.window.swap({ direction = "d" }))

o.bind("ALT + TAB", "Siguiente ventana", hl.dsp.window.cycle_next())
o.bind("ALT + SHIFT + TAB", "Ventana anterior", hl.dsp.window.cycle_next({ next = false }))

o.bind("SUPER + code:20", "Estrechar ventana", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + code:21", "Ensanchar ventana", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))

o.bind("SUPER + mouse:272", "Arrastrar ventana", hl.dsp.window.drag(), { mouse = true })
o.bind("SUPER + mouse:273", "Redimensionar ventana", hl.dsp.window.resize(), { mouse = true })

-- ── Escritorios ───────────────────────────────────────────────────────────
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind("SUPER + " .. key, "Ir al escritorio " .. workspace,
    hl.dsp.focus({ workspace = tostring(workspace) }))
  o.bind("SUPER + SHIFT + " .. key, "Llevar ventana al escritorio " .. workspace,
    hl.dsp.window.move({ workspace = tostring(workspace) }))
end

o.bind("SUPER + TAB", "Escritorio siguiente", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + SHIFT + TAB", "Escritorio anterior", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + mouse_down", "Escritorio siguiente", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + mouse_up", "Escritorio anterior", hl.dsp.focus({ workspace = "e-1" }))

o.bind("SUPER + S", "Scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("SUPER + ALT + S", "Llevar al scratchpad",
  hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- ── Aplicaciones ──────────────────────────────────────────────────────────
o.bind("SUPER + RETURN", "Terminal", { launch = "alacritty" })
o.bind("SUPER + SHIFT + RETURN", "Navegador", { launch = "zen-browser" })
o.bind("SUPER + SHIFT + F", "Archivos", { launch = "nautilus --new-window" })
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })
o.bind("SUPER + SPACE", "Lanzador", "fuzzel")

-- ── Utilidades ────────────────────────────────────────────────────────────
o.bind("SUPER + CTRL + L", "Bloquear pantalla", "hyprlock")
o.bind("PRINT", "Captura de región", "grim -g \"$(slurp)\" - | satty --filename -")
o.bind("SHIFT + PRINT", "Captura de pantalla completa", "grim - | satty --filename -")
o.bind("SUPER + PRINT", "Cuentagotas de color", "pkill hyprpicker || hyprpicker -a")
o.bind("SUPER + V", "Historial del portapapeles",
  "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy")
o.bind("SUPER + SHIFT + SPACE", "Mostrar/ocultar barra", "pkill -SIGUSR1 waybar")

-- ── Teclas multimedia ─────────────────────────────────────────────────────
o.bind("XF86AudioRaiseVolume", "Subir volumen", "swayosd-client --output-volume raise", { locked = true })
o.bind("XF86AudioLowerVolume", "Bajar volumen", "swayosd-client --output-volume lower", { locked = true })
o.bind("XF86AudioMute", "Silenciar", "swayosd-client --output-volume mute-toggle", { locked = true })
o.bind("XF86AudioMicMute", "Silenciar micrófono", "swayosd-client --input-volume mute-toggle", { locked = true })
o.bind("XF86MonBrightnessUp", "Más brillo", "swayosd-client --brightness raise", { locked = true })
o.bind("XF86MonBrightnessDown", "Menos brillo", "swayosd-client --brightness lower", { locked = true })
o.bind("XF86AudioPlay", "Reproducir/pausar", "playerctl play-pause", { locked = true })
o.bind("XF86AudioNext", "Siguiente pista", "playerctl next", { locked = true })
o.bind("XF86AudioPrev", "Pista anterior", "playerctl previous", { locked = true })

-- ── Tuyos, restaurados desde bindings.conf (pre-quattro) ──────────────────
o.bind("SUPER + ALT + W", "Fondo aleatorio", "$HOME/.local/bin/wall-random")
o.bind("SUPER + L", "Alternar disposición master/dwindle", "$HOME/.local/bin/hypr-toggle-master-dwindle")
