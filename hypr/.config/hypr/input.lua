-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- Velocidad de scroll por aplicación.
-- hl.window_rule({ name = "scroll-term", match = { class = "(Alacritty|kitty|foot)" }, scroll_touchpad = 1.5 })
-- hl.window_rule({ name = "scroll-ghostty", match = { class = "com.mitchellh.ghostty" }, scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })

-- ── Restaurado desde input.conf (pre-quattro) ─────────────────────────────
hl.config({
  input = {
    kb_options = "ctrl:nocaps,shift:both_capslock_cancel",

    repeat_rate = 40,
    repeat_delay = 600,

    numlock_by_default = true,

    accel_profile = "flat",
    -- force_no_accel bypasses libinput entirely and makes `sensitivity` a no-op.
    -- force_no_accel = true,

    -- Rango: -1.0 (más lento) .. 0 (normal) .. 1.0 (más rápido)
    sensitivity = -0.5,
    follow_mouse = 1,
  },
})

-- Scroll más cómodo en terminales
hl.window_rule({ name = "scroll-terminales", match = { class = "(Alacritty|kitty|foot)" }, scroll_touchpad = 1.5 })
hl.window_rule({ name = "scroll-ghostty", match = { class = "com.mitchellh.ghostty" }, scroll_touchpad = 0.2 })
