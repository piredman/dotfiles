-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Start weztterm in fullscreen mode
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- there is a bug in wayland currenlty, this must be set to false for wezterm to start at all
-- in hyprland. Once this is fixed, change back to true.
-- https://www.reddit.com/r/archlinux/comments/18rf5t1/psa_on_hyprland_wezterm_will_not_start_anymore
-- This setting is ignored in macos & windows, so safe to have in config for all platforms.
config.enable_wayland = false

config.enable_tab_bar = false

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
-- config.text_background_opacity = 0.3

config.font = wezterm.font_with_fallback({ "CaskaydiaCove Nerd Font", "Symbols Nerd Font", "Libertinus Math" })
-- config.font = wezterm.font_with_fallback({ "Hack Nerd Font", "Symbols Nerd Font", "Libertinus Math" })
config.font_size = 16.0

config.color_scheme = "Catppuccin Mocha"
config.colors = {
	background = "#1e1e1e",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.use_ime = false
config.warn_about_missing_glyphs = false

return config
