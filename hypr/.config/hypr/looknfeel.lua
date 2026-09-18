-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- hl.config({
--   general = {
--     -- No gaps between windows or borders.
--     gaps_in = 0,
--     gaps_out = 0,
--     border_size = 0,
--
--     -- Change to niri-like side-scrolling layout.
--     layout = "scrolling",
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

-- ── Restaurado desde looknfeel.conf (pre-quattro) ─────────────────────────
hl.config({
  general = {
    -- Layout master con la ventana principal centrada
    layout = "master",
  },

  decoration = {
    -- Atenuar ventanas sin foco
    dim_inactive = true,
    dim_strength = 0.15,

    -- Transparencia en ventanas sin foco
    active_opacity = 1.0,
    inactive_opacity = 0.90,
  },

  master = {
    mfact = 0.5,
    new_status = "slave",
    orientation = "center",
    slave_count_for_center_master = 0,
    center_master_fallback = "right",
  },
})

-- ── Animaciones ───────────────────────────────────────────────────────────
-- Las de fábrica de Hyprland usan muelles (spring = "easy") para las ventanas,
-- que es lo que da la sensación "smooth". Omarchy usaba curvas bezier cortas y
-- desactivaba la animación de escritorios. Esto va un paso más allá.
--
-- La velocidad se mide en DECISEGUNDOS de duración: más bajo = más rápido.
-- Para desactivarlas del todo:  hl.config({ animations = { enabled = false } })

local snap = 0.5 -- multiplicador global: 1.0 = como Omarchy, 0.5 = el doble de rápido

local function anim(leaf, speed, curve, style)
  local a = { leaf = leaf, enabled = true, speed = speed * snap }
  if curve then a.bezier = curve end
  if style then a.style = style end
  hl.animation(a)
end

hl.config({ animations = { enabled = true } })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Ventanas: bezier en vez de muelle. Aquí está el 90% del "snappy".
anim("windows", 3.79, "easeOutQuint")
anim("windowsIn", 4.1, "easeOutQuint", "popin 90%")
anim("windowsOut", 1.49, "linear", "popin 90%")
anim("border", 5.39, "easeOutQuint")

-- Desvanecidos
anim("fade", 3.03, "quick")
anim("fadeIn", 1.73, "almostLinear")
anim("fadeOut", 1.46, "almostLinear")
hl.animation({ leaf = "fadeSwitch", enabled = false })

-- Capas (barra, menús, notificaciones)
anim("layers", 3.81, "easeOutQuint")
anim("layersIn", 4, "easeOutQuint", "fade")
anim("layersOut", 1.5, "linear", "fade")
anim("fadeLayersIn", 1.79, "almostLinear")
anim("fadeLayersOut", 1.39, "almostLinear")

-- Cambio de escritorio: instantáneo, como en Omarchy.
hl.animation({ leaf = "workspaces", enabled = false })
anim("specialWorkspace", 3, "easeOutQuint", "slidevert")
