-- Qué arranca con la sesión. Sustituye al autostart de Omarchy.

o.launch_on_start("waybar")            -- barra
o.launch_on_start("mako")              -- notificaciones
o.launch_on_start("hypridle")          -- bloqueo por inactividad
o.launch_on_start("swayosd-server")    -- OSD de volumen/brillo
o.launch_on_start("hyprpaper")         -- fondo de pantalla

-- Historial de portapapeles
o.exec_on_start("wl-paste --type text --watch cliphist store")
o.exec_on_start("wl-paste --type image --watch cliphist store")
