-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = 'Catppuccin Mocha'
--config.term = "wezterm"

-- and finally, return the configuration to wezterm
return config
