-- Casi todo arranca por unidades de systemd de usuario, no desde aquí:
--   waybar, mako, hypridle, cliphist, swaybg
--   (systemctl --user enable --now <servicio>)
-- Son PartOf=graphical-session.target, así que paran y arrancan con la sesión,
-- y tienen Restart=on-failure. Aquí solo queda lo que no trae unidad.
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm-app -- swayosd-server") -- OSD de volumen/brillo
end)
