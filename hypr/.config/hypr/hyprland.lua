-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- Keep the screensaver/lock away while a Firefox-based browser is fullscreen.
-- Firefox/Zen only inhibits idle over D-Bus (org.freedesktop.ScreenSaver), and
-- since Omarchy 4 replaced hypridle with the Quickshell idle service nothing
-- owns that bus name, so its inhibit is silently dropped. Let Hyprland hold the
-- Wayland idle inhibitor instead.
o.window({ tag = "firefox-based-browser" }, { idle_inhibit = "fullscreen" })

-- A picture-in-picture window only exists while a video is playing.
o.window({ tag = "pip" }, { idle_inhibit = "always" })
