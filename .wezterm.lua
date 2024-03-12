local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--Window display configuration
-- config.color_scheme = 'Trim Yer Beard (terminal.sexy)'
-- config.color_scheme = 'Greenscreen (dark) (terminal.sexy)'
config.color_scheme = 'Homebrew'
-- config.color_scheme = 'HaX0R_GR33N'
config.enable_tab_bar = false
config.window_background_opacity = .5
config.text_background_opacity = 0.3


--Font configuration
config.font = wezterm.font 'Source Code Pro'
config.font_size = 20.0


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
}

return config

