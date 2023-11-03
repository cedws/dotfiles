local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Ayu Mirage'
config.font = wezterm.font 'JetBrains Mono'
config.default_cursor_style = 'SteadyBar'

return config
