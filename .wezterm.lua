local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--Window display configuration
-- config.color_scheme = 'Trim Yer Beard (terminal.sexy)'
-- config.color_scheme = 'Greenscreen (dark) (terminal.sexy)'
config.color_scheme = 'Homebrew'
-- config.color_scheme = 'HaX0R_GR33N'
config.enable_tab_bar = true
config.window_background_opacity = .75
config.text_background_opacity = 0.3
config.hide_mouse_cursor_when_typing = false


--Font configuration
config.font = wezterm.font 'Source Code Pro'
config.font_size = 14.0


--Key configuration
config.keys = {
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = '_',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection "Right"
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection "Up"
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection "Down"
  },
}

return config

