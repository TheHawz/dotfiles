local active_border_color = { colors = { "rgba(a8c0ccee)", "rgba(6a8894ee)" }, angle = 45 }
local inactive_border_color = "rgba(22262daa)"

hl.config({
  -- Radio unificado: mismo valor que las pildoras de waybar, fuzzel y mako.
  decoration = {
    rounding = 8,
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
