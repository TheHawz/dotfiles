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
-- Escala de duraciones CON NOMBRE, en vez de once velocidades sueltas puestas
-- a ojo. Idea tomada de Ryoku (fast/glide/standard/morph). Se ajusta el
-- conjunto tocando un nombre, no revisando quince lineas.
--
-- Hyprland mide en DECISEGUNDOS: 1.4 = 140 ms.

local d = {
  fast     = 1.4, -- salidas, cierres: lo que estorba si dura
  glide    = 2.6, -- bordes y capas
  standard = 3.0, -- ventanas: el ritmo base
  morph    = 4.2, -- cambios de forma grandes
}

-- Una sola curva para todo. Es la de Ryoku: cubic-bezier(0.16, 1, 0.3, 1),
-- una ease-out marcada, que arranca rapido y frena suave.
hl.curve("ease", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.config({ animations = { enabled = true } })

local function anim(leaf, dur, style)
  local a = { leaf = leaf, enabled = true, speed = dur, bezier = "ease" }
  if style then a.style = style end
  hl.animation(a)
end

-- Ventanas
anim("windows", d.standard)
anim("windowsIn", d.standard, "popin 90%")
anim("windowsOut", d.fast, "popin 90%")
anim("border", d.glide)

-- Desvanecidos
anim("fade", d.fast)
anim("fadeIn", d.fast)
anim("fadeOut", d.fast)
hl.animation({ leaf = "fadeSwitch", enabled = false })

-- Capas: barra, menus, notificaciones
anim("layers", d.glide, "fade")
anim("layersIn", d.glide, "fade")
anim("layersOut", d.fast, "fade")
anim("fadeLayersIn", d.fast)
anim("fadeLayersOut", d.fast)

-- Escritorios: instantaneo
hl.animation({ leaf = "workspaces", enabled = false })
anim("specialWorkspace", d.morph, "slidevert")
