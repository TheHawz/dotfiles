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

require("hypr.lib")

-- Valores base que antes ponía Omarchy
hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,
    layout = "dwindle",
    resize_on_border = true,
  },
  decoration = {
    rounding = 8,
    blur = { enabled = true, size = 6, passes = 2 },
  },
  dwindle = {
    pseudotile = true,
    preserve_split = true,
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 0,
  },
})

-- Colores del tema (generado por mytheme; ver theme/bin/render-theme.sh)
pcall(require, "hypr.theme")

require("hypr.monitors")
require("hypr.input")
require("hypr.looknfeel")
require("hypr.bindings")
require("hypr.autostart")
