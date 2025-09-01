-- __init__
local wezterm = require("wezterm")
local config = wezterm.config_builder() -- Wallis... hold on to this
local act = wezterm.action

-- COLORS OF MY HEART... NOT RED
config.colors = {
  foreground = "#CBE0F0",
    background = "#011423",
    cursor_bg = "#47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = {
      "#214969", "#E52E2E", "#44FFB1", "#FFE073",
      "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7",
    },
    brights = {
      "#214969", "#E52E2E", "#44FFB1", "#FFE073",
      "#A277FF", "#a277ff", "#24EAF7", "#24EAF7",
    },
}

-- FONTIZATION (I DON'T CARE IF THERE'S NO WORD LIKE THAT)
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "FiraCode Nerd Font",
  "Noto Color Emoji",
})
config.font_size = 13 -- KiKiKiMaMaMa... IThoughtItWas... ChuChuChuHaHaHa

-- MY WINDOW
config.window_background_opacity = 0.95
config.window_frame = {
  border_left_width = 0.78,
  border_right_width = 0.78,
  border_bottom_height = 0.27,
  border_top_height = 0.27,
  border_left_color = "#033259",
  border_right_color = "#033259",
  border_top_color = "#033259",
  border_bottom_color = "#033259",
}

-- NOW... ABOUT THE TABS
config.enable_tab_bar = false
config.use_fancy_tab_bar = false

-- BINDING-KEYS
config.keys = {
  { key = "Backspace", mods = "CTRL", action = act.SendString("\x17") }, -- Ctrl-W
  { key = "\\", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "CTRL|ALT", action = act.ActivatePaneDirection("Down") },
  { key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration }, -- reload config
}

-- SIZE & PADDING
config.initial_cols = 120
config.initial_rows = 30
config.window_padding = { left = 2, right = 2, top = 2, bottom = 2 }

return config
-- END OF LINE

