local active_border_color = {{ hypr_gradient hyprland_active_border accent }}
local inactive_border_color = {{ hypr_gradient hyprland_inactive_border rgba(595959aa) }}

hl.config({
  -- Radio unificado: mismo valor que las pildoras de waybar, fuzzel y mako.
  decoration = {
    rounding = {{ radius }},
  },

  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
})
