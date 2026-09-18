-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Escala 1 sobre 3840x2160: maximo espacio.
-- Electron (Zen, Ferdium, Obsidian) dibuja su UI segun la escala del
-- compositor y a 1.25 quedaba demasiado grande; a 1 se ve como quieres.
-- Contrapartida: lo que no escala solo (foot, waybar) hay que agrandarlo
-- a mano; ver el tamano de fuente de foot.ini y la altura en waybar.
local monitor_scale = 1

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
