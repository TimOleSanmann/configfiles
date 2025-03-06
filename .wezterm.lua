-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'catppuccin-frappe'
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
  -- Make Option-Right equivalent to Alt-f; forward-word
  {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
}


return config
