-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.default_prog = { "zsh" }

config.colors = {
	background = "#020403",
}
config.window_background_opacity = 0.9
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.3,
}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
