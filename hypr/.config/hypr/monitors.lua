-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Escalado real de Wayland, no el truco de GDK_SCALE.
-- A 1.25 sobre 3840x2160 quedan 3072x1728 logicos: sigue siendo mucho
-- espacio y todo se escala por igual, sea GTK, Electron o no.
-- Sube a 1.5 (2560x1440) si quieres las cosas mas grandes.
local monitor_scale = 1.25

-- GDK_SCALE se declara a 1 EXPLICITAMENTE, no se omite. Hyprland conserva las
-- variables de hl.env() aunque se borren del config: quitar la linea no la
-- desactiva en la sesion viva. Con escalado real de Wayland, GDK_SCALE debe
-- valer 1 o se multiplica con la escala del monitor (2 x 1.25 = 2.5).
hl.env("GDK_SCALE", "1")

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
