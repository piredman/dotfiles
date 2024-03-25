-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_tab_bar = false

config.window_background_opacity = 0.95
config.text_background_opacity = 0.3

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("Hack Nerd Font", { bold = false, italic = false })

-- and finally, return the configuration to wezterm
return config
