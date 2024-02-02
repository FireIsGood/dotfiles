-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

--
-- Configuration settings
--

-- Basic appearance
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("FiraCode Nerd Font", { italic = false })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 10.0
config.line_height = 1.05
config.underline_thickness = 3
config.underline_position = -4

-- /=

-- Tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Sizing
config.initial_cols = 110
config.initial_rows = 28
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Keymaps
config.keys = {
	-- Turn off the default tabs and stuff
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "U", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "U", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
}

-- and finally, return the configuration to wezterm
return config
