local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      maximized = false,
      floating = true, -- like macos; default floating, tile selected
    },
  },

  { rule_any = { type = { 'normal', 'dialog' } }, properties = {
    titlebars_enabled = function(c)
      return not c.requests_no_titlebar
    end,
  } },

  -- Floating clients.
  {
    rule_any = {
      instance = {},
      class = {
        'Blueman-manager',
        'Xfce4-appfinder',
        'Pavucontrol',
      },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {},
      role = {
        'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true },
  },

  -- stop the dumb fullscreen thing
  {
    rule_any = {
      class = {
        'Microsoft-edge', -- fullscreen
        'Code',
      },
    },
    properties = {
      floating = false,
      fullscreen = false,
      maximized = false,
    },
  },

  -- obsidian, firefox -> second monitor
  {
    rule_any = {
      class = {
        'obsidian',
        'discord',
        'Discord',
        'firefox',
      },
    },
    properties = {
      -- screen = 2,
      tag = tall_main,
      fullscreen = false,
      floating = false,
      maximized = false,
    },
  },

  -- wezterm
  {
    rule_any = {
      class = {
        'org.wezfurlong.wezterm',
      },
    },
    properties = {
      screen = 1,
      first_tag = tag_main,
      floating = false,
    },
  },

  -- all other regular tiled windows
  {
    rule_any = {
      class = {},
    },
    properties = {
      floating = false,
    },
  },

  -- -- main window don't float (buggy unless tiled)
  -- {
  --   name = {
  --     'Steam',
  --   },
  --   class = { 'steam' },
  --   properties = {
  --     float = false,
  --     screen = 1,
  --     tag = tag_second,
  --   },
  -- },

  {
    rule_any = {
      name = {
        'steam',
        'steamwebhelper',
      },
      instance = {
        'steam',
        'Steam',
        'steamwebhelper',
      },
    },
    properties = {
      float = false, -- float is buggy.
      screen = 1,
      tag = tag_second,
    },
  },

  -- no title bars
  -- gamescope -w 2560 -h 1440 -W 2560 -H 1440 -- %command%
  {
    rule_any = {
      class = { '.gamescope-wrapped' }, -- steam_app_553850
    },
    properties = {
      titlebars_enabled = false,
    },
  },

  -- fullscreen games
  {
    rule_any = {
      -- name = { 'HELLDIVERS™ 2' }, -- steam_app_553850
      class = { 'steam_app_553850' }, -- steam_app_553850
    },
    properties = {
      float = false, -- float is buggy.
      screen = 1,
      fullscreen = true,
      maximized = true,
      tag = tag_second,
      titlebars_enabled = false,
    },
  },

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { screen = 1, tag = "2" } },
}
-- }}}
