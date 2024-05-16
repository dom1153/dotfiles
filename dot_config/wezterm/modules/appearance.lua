local wezterm = require('wezterm')
local hostname = wezterm.hostname()

local module = {}

function module.apply_to_config(config)
  config.color_scheme = 'Catppuccin Mocha'

  local set_font = function(font)
    config.font = font.font
    config.font_size = font.font_size
  end

  -- fallback will report errors if not found
  -- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
  -- Luckily, should include a nerd font out of the box
  if hostname == 'stella-hoshii.local' then
    -- cozette size will vary per os in vector form 🤷
    -- https://www.sven.de/dpi/
    -- 257.56 ppi ; 9.4pts on a 100dpi ; so 24.21 for a 257.56 screen
    -- lower font takes precedence
    set_font({ font = wezterm.font('CozetteVector'), font_size = 12.10 })
    set_font({ font = wezterm.font('FiraCode Nerd Font Mono'), font_size = 11.0 })

    -- You can specify your own fallback; that's useful if you've got a killer monospace font, but it doesn't have glyphs for the asian script that you sometimes work with:
    -- config.font = wezterm.font_with_fallback {
    --   'Fira Code',
    --   'DengXian',
    -- }
  elseif hostname == 'DomArtProW11' then
    set_font({ font = wezterm.font('JetBrains Mono'), font_size = 11.0 })
  else
    -- titlebar
    config.window_decorations = 'RESIZE'
  end

  -- disable ligatures
  config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

  -- tab bar
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_max_width = 999

  config.window_background_opacity = 0.95

  -- bell
  config.audible_bell = 'Disabled'

  -- behavior
  config.window_close_confirmation = 'NeverPrompt'

  if hostname == 'jill-stingray' or hostname == 'sei-asagiri' then
    -- hyprland isn't working with wezterm wayland, x11 will do, if I try it
    config.enable_wayland = false
    config.font = wezterm.font('dina')
    config.font_size = 10.0
  end
end

return module
