local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')

-- Theme (init early to correctly specify icons)
-- beautiful.init(gears.filesystem.get_themes_dir() .. 'zenburn/theme.lua')
beautiful.init(gears.filesystem.get_configuration_dir() .. 'lib/theme.lua')

terminal = 'wezterm'

-- This is used later as the default terminal and editor to run.
-- local terminal = 'wezterm'
editor = os.getenv('EDITOR') or 'vim'
editor_cmd = terminal .. ' -e ' .. editor

modkey = 'Mod4'

-- openbar style luancher
myawesomemenu = {
  {
    'hotkeys',
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { 'manual', terminal .. ' -e man awesome' },
  { 'edit config', editor_cmd .. ' ' .. awesome.conffile },
  { 'restart', awesome.restart },
  {
    'quit',
    function()
      awesome.quit()
    end,
  },
}

-- menubar items
mymainmenu = awful.menu({ items = {
  { 'awesome', myawesomemenu, beautiful.awesome_icon },
  { 'open terminal', terminal },
} })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t)
    t:view_only()
  end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
  end),
  awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
  end)
)

-- window list (taskbar)
tasklist_buttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal('request::activate', 'tasklist', { raise = true })
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end)
)

function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, false)
  end
end

-- 一 二 三 四 五 六 七 八 九 十

-- Main
tag_main = awful.tag.add('一', {
  layout = awful.layout.suit.tile,
  gap_single_client = true,
  -- gap = 10,
  screen = 1,
  selected = true,
})
-- Game
tag_second = awful.tag.add('二', {
  -- layout = awful.layout.suit.max.fullscreen,
  layout = awful.layout.suit.tile,
  -- gap = 0,
  screen = 1,
})
tag_third = awful.tag.add('三', {
  layout = awful.layout.suit.tile,
  screen = 1,
})
tag_fourth = awful.tag.add('四', {
  layout = awful.layout.suit.tile,
  screen = 1,
})
tag_fifth = awful.tag.add('五', {
  layout = awful.layout.suit.tile,
  gap_single_client = true,
  -- gap = 10,
  screen = 1,
})

-- tall screen
if screen:count() >= 2 then
  -- monitor 2
  tall_main = awful.tag.add('Tall', {
    layout = awful.layout.suit.tile.top,
    gap_single_client = true,
    -- gap = 15,
    screen = 2,
    selected = true,
  })
  awful.tag.add('Foo', {
    layout = awful.layout.suit.tile.top,
    gap_single_client = true,
    -- gap = 15,
    screen = 2,
  })
  awful.tag.add('Wall', {
    layout = awful.layout.suit.tile.top,
    gap_single_client = true,
    -- gap = 15,
    screen = 2,
  })
end
