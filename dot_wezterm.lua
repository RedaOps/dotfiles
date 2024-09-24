-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Cai (Gogh)'

config.enable_kitty_keyboard = true

config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
    {
      key = 'E',
      mods = 'CTRL|SHIFT',
      action = act.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },
  }

for i = 1, 8 do
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = act.ActivateTab(i - 1),
  })
end

config.background = {
  {
    source = {
      File = "/Users/tudorg/Pictures/vyp8vai9nzod1.png",
    },
    hsb = {brightness = 0.1}
  }
}

-- and finally, return the configuration to wezterm
return config
