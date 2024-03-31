-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- there is a bug in wayland currenlty, this must be set to false for wezterm to start at all
-- in hyprland. Once this is fixed, change back to true.
-- https://www.reddit.com/r/archlinux/comments/18rf5t1/psa_on_hyprland_wezterm_will_not_start_anymore
-- This setting is ignored in macos & windows, so safe to have in config for all platforms.
config.enable_wayland = false

config.enable_tab_bar = false

config.window_background_opacity = 0.95
-- config.text_background_opacity = 0.3

config.font = wezterm.font("Hack Nerd Font", { bold = false, italic = false })
config.font_size = 16.0

config.color_scheme = "Catppuccin Mocha"
config.colors = {
	background = "#1e1e1e",
}

return config
