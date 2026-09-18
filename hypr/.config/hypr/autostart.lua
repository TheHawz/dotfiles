-- Qué arranca con la sesión. Sustituye al autostart de Omarchy.
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  -- Bajo uwsm, para que cada uno tenga su scope de systemd.
  hl.exec_cmd("uwsm-app -- waybar")         -- barra
  hl.exec_cmd("uwsm-app -- mako")           -- notificaciones
  hl.exec_cmd("uwsm-app -- hypridle")       -- bloqueo por inactividad
  hl.exec_cmd("uwsm-app -- swayosd-server") -- OSD de volumen/brillo
  hl.exec_cmd("uwsm-app -- hyprpaper")      -- fondo de pantalla

  -- Historial del portapapeles
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
