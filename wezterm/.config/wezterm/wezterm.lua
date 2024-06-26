local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Catppuccin Frappe"
config.enable_tab_bar = false
config.font = wezterm.font("Fira Code")
config.font_size = 12.5
config.line_height = 1.2
config.window_background_opacity = 0.8
config.enable_wayland = false

return config
