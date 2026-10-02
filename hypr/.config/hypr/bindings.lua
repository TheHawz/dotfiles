-- Atajos. Núcleo curado de los 226 que traía Omarchy.
-- API nativa de Hyprland: https://wiki.hypr.land/Configuring/Basics/Binds/
-- La lista completa rescatada está en dotfiles/rescate/.

local mod = "SUPER"

-- Lanza bajo uwsm para que la app quede en su propio scope de systemd.
local function app(command)
  return hl.dsp.exec_cmd("uwsm-app -- " .. command)
end

local function run(command)
  return hl.dsp.exec_cmd(command)
end

local function desc(text)
  return { description = text }
end

-- ── Ventanas ──────────────────────────────────────────────────────────────
hl.bind(mod .. " + W", hl.dsp.window.close(), desc("Cerrar ventana"))
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"), desc("Alternar división"))
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }), desc("Flotante / mosaico"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), desc("Pantalla completa"))
hl.bind(mod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), desc("Ancho completo"))
hl.bind(mod .. " + G", hl.dsp.group.toggle(), desc("Agrupar ventanas"))

hl.bind(mod .. " + LEFT", hl.dsp.focus({ direction = "l" }), desc("Foco a la izquierda"))
hl.bind(mod .. " + RIGHT", hl.dsp.focus({ direction = "r" }), desc("Foco a la derecha"))
hl.bind(mod .. " + UP", hl.dsp.focus({ direction = "u" }), desc("Foco arriba"))
hl.bind(mod .. " + DOWN", hl.dsp.focus({ direction = "d" }), desc("Foco abajo"))

hl.bind(mod .. " + SHIFT + LEFT", hl.dsp.window.swap({ direction = "l" }), desc("Mover ventana a la izquierda"))
hl.bind(mod .. " + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "r" }), desc("Mover ventana a la derecha"))
hl.bind(mod .. " + SHIFT + UP", hl.dsp.window.swap({ direction = "u" }), desc("Mover ventana arriba"))
hl.bind(mod .. " + SHIFT + DOWN", hl.dsp.window.swap({ direction = "d" }), desc("Mover ventana abajo"))

hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), desc("Siguiente ventana"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }), desc("Ventana anterior"))

hl.bind(mod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), desc("Estrechar ventana"))
hl.bind(mod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), desc("Ensanchar ventana"))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { description = "Arrastrar ventana", mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { description = "Redimensionar ventana", mouse = true })

-- ── Escritorios ───────────────────────────────────────────────────────────
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }),
    desc("Ir al escritorio " .. workspace))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }),
    desc("Llevar ventana al escritorio " .. workspace))
end

hl.bind(mod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }), desc("Escritorio siguiente"))
hl.bind(mod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), desc("Escritorio anterior"))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), desc("Escritorio siguiente"))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), desc("Escritorio anterior"))

hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"), desc("Scratchpad"))
hl.bind(mod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }),
  desc("Llevar al scratchpad"))

-- ── Aplicaciones ──────────────────────────────────────────────────────────
hl.bind(mod .. " + RETURN", app("foot"), desc("Terminal"))
hl.bind(mod .. " + SHIFT + RETURN", app("zen-browser"), desc("Navegador"))
hl.bind(mod .. " + SHIFT + F", app("nautilus --new-window"), desc("Archivos"))
hl.bind(mod .. " + SHIFT + W", app("typora --enable-wayland-ime"), desc("Typora"))
hl.bind(mod .. " + SPACE", run("fuzzel"), desc("Lanzador"))

-- ── Utilidades ────────────────────────────────────────────────────────────
hl.bind(mod .. " + CTRL + L", run("hyprlock"), desc("Bloquear pantalla"))
hl.bind(mod .. " + ESCAPE", run("$HOME/.local/bin/power-menu"), desc("Menú de sistema"))
hl.bind("PRINT", run('grim -g "$(slurp)" - | satty --filename -'), desc("Captura de región"))
hl.bind("SHIFT + PRINT", run("grim - | satty --filename -"), desc("Captura de pantalla completa"))
hl.bind(mod .. " + PRINT", run("pkill hyprpicker || hyprpicker -a"), desc("Cuentagotas de color"))
hl.bind(mod .. " + V", run("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"),
  desc("Historial del portapapeles"))
hl.bind(mod .. " + SHIFT + SPACE", run("pkill -SIGUSR1 waybar"), desc("Mostrar/ocultar barra"))

-- ── Teclas multimedia ─────────────────────────────────────────────────────
local function media(keys, command, text)
  hl.bind(keys, hl.dsp.exec_cmd(command), { description = text, locked = true })
end

media("XF86AudioRaiseVolume", "swayosd-client --output-volume raise", "Subir volumen")
media("XF86AudioLowerVolume", "swayosd-client --output-volume lower", "Bajar volumen")
media("XF86AudioMute", "swayosd-client --output-volume mute-toggle", "Silenciar")
media("XF86AudioMicMute", "swayosd-client --input-volume mute-toggle", "Silenciar micrófono")
media("XF86MonBrightnessUp", "swayosd-client --brightness raise", "Más brillo")
media("XF86MonBrightnessDown", "swayosd-client --brightness lower", "Menos brillo")
media("XF86AudioPlay", "playerctl play-pause", "Reproducir/pausar")
media("XF86AudioNext", "playerctl next", "Siguiente pista")
media("XF86AudioPrev", "playerctl previous", "Pista anterior")

-- ── Tuyos, restaurados desde bindings.conf (pre-quattro) ──────────────────
hl.bind(mod .. " + ALT + W", run("$HOME/.local/bin/wallpaper"), desc("Cambiar fondo"))
hl.bind(mod .. " + L", run("$HOME/.local/bin/hypr-toggle-master-dwindle"),
  desc("Alternar disposición master/dwindle"))
