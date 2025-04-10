local wezterm = require 'wezterm';

return {
  color_scheme = 'Dark Ocean (terminal.sexy)',
  font = wezterm.font("0xProto Nerd Font"),
  font_size = 14.0,
  line_height = 1.3,
  harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
  disable_default_key_bindings = true,
  leader = { key = '.', mods = 'CMD', timeout_milliseconds = 2000 },
  keys = {
    {
      key = "\\",
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 't',
      mods = 'CMD',
      action = wezterm.action { SpawnTab = "CurrentPaneDomain" }
    },
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action { CloseCurrentPane = { confirm = true } }
    },
    {
      key = "\\",
      mods = "CMD",
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = "-",
      mods = "CMD",
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = "c",
      mods = "CMD",
      action = wezterm.action.CopyTo 'Clipboard'
    },
    {
      key = "v",
      mods = "CMD",
      action = wezterm.action.PasteFrom 'Clipboard'
    },
    {
      key = "1",
      mods = "CMD",
      action = wezterm.action { ActivateTab = 0 }
    },
    {
      key = "2",
      mods = "CMD",
      action = wezterm.action { ActivateTab = 1 }
    },
    {
      key = "3",
      mods = "CMD",
      action = wezterm.action { ActivateTab = 2 }
    },
    {
      key = "4",
      mods = "CMD",
      action = wezterm.action { ActivateTab = 3 }
    },
    {
      key = "5",
      mods = "CMD",
      action = wezterm.action { ActivateTab = 4 }
    },
    {
      key = "6",
      mods = "CMD",
      action = wezterm.action { ActivateTab = 5 }
    },
    {
      key = "p",
      mods = "CMD",
      action = wezterm.action { PaneSelect = { alphabet = "123456789" } }
    },
    {
      key = "v",
      mods = "LEADER",
      action = wezterm.action.ActivateCopyMode
    }
  }
}
