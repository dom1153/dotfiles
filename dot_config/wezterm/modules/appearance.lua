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
    -- set_font({ font = wezterm.font('CozetteVector'), font_size = 12.10 })
    set_font({ font = wezterm.font('FiraCode Nerd Font Mono'), font_size = 11.0 })

    -- titlebar
    config.window_decorations = 'RESIZE'
  elseif hostname == 'DomArtProW11' or hostname == 'kim-la-vallete' then
    set_font({ font = wezterm.font('JetBrains Mono'), font_size = 11.0 })
  elseif hostname == 'jill-stingray' or hostname == 'sei-asagiri' then
    -- hyprland isn't working with wezterm wayland, force x11
    config.enable_wayland = false

    -- You can specify your own fallback; wezterm occasionally warns of missing glyphs. Hopefully this fixes this
    config.font = wezterm.font_with_fallback({
      'dina',
      'FiraCode Nerd Font Mono',
      'JetBrains Mono',
    })
    config.font_size = 11.0
    -- no titlebar for linux cuz we cool like that
    config.window_decorations = 'NONE'
  else
    -- titlebar
    config.window_decorations = 'RESIZE'
  end

  -- ignore popup for missing symbols
  config.warn_about_missing_glyphs = false

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
end

return module
