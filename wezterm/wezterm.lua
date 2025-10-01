local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- font configuration
config.font = wezterm.font_with_fallback({
	"CaskaydiaCove Nerd Font",
	"Symbols Nerd Font",
	"Libertinus Math",
})
config.font_size = 16.0

-- settings
config.enable_tab_bar = false
config.max_fps = 120
config.animation_fps = 1
config.window_background_opacity = 0.98
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false
config.enable_wayland = false
config.front_end = "OpenGL"
config.webgpu_power_preference = "HighPerformance"
config.prefer_egl = true
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.hide_tab_bar_if_only_one_tab = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.use_ime = false

-- colour scheme
config.color_scheme = "Catppuccin Mocha"
config.colors = {
	background = "#1e1e1e",
}

-- appearance
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- keybindings
config.keys = {
	-- Clears the scrollback and viewport, and then sends CTRL-L to ask the
	-- shell to redraw its prompt
	{
		key = "C",
		mods = "CTRL|SHIFT",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			-- act.SendKey({ key = "A", mods = "CTRL" }),
			-- act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

return config
