-- Configuración de Hyprland — propia, sin Omarchy.
-- Docs: https://wiki.hypr.land/Configuring/Start/

-- Permite que require("hypr.x") encuentre ~/.config/hypr/x.lua
local home = os.getenv("HOME")
package.path = home .. "/.config/?.lua;" .. package.path

-- Recarga limpia de nuestros módulos al reiniciar la config
for module in pairs(package.loaded) do
  if module == "hypr" or module:sub(1, 5) == "hypr." then
    package.loaded[module] = nil
  end
end

-- Valores base que antes ponía Omarchy
hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,
    -- El layout lo fija looknfeel.lua (master)
    resize_on_border = true,
  },
  decoration = {
    -- rounding lo fija el tema (token radius)
    blur = { enabled = true, size = 6, passes = 2 },
  },
  dwindle = {
    preserve_split = true,
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 0,
  },
})

-- Colores del tema, generados por ~/.config/mytheme/bin/apply-theme.sh
pcall(dofile, home .. "/.config/mytheme/hyprland.lua")

require("hypr.monitors")
require("hypr.input")
require("hypr.looknfeel")
require("hypr.bindings")
require("hypr.autostart")
