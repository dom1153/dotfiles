local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')

awful.tag.add('Main', {
  layout = awful.layout.suit.tile,
  gap_single_client = true,
  -- gap = 10,
  screen = 1,
  selected = true,
})

-- todo: add rules to fullscreen steam related apps
awful.tag.add('Game', {
  -- layout = awful.layout.suit.max.fullscreen,
  layout = awful.layout.suit.tile,
  -- gap = 0,
  screen = 1,
})

awful.tag.add('3', {
  layout = awful.layout.suit.tile,
  screen = 1,
})
awful.tag.add('4', {
  layout = awful.layout.suit.tile,
  screen = 1,
})

awful.tag.add('Foo', {
  layout = awful.layout.suit.tile.bottom,
  gap_single_client = true,
  -- gap = 15,
  screen = 2,
  selected = true,
})

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  -- awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 3, function()
      awful.layout.inc(-1)
    end),
    awful.button({}, 4, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 5, function()
      awful.layout.inc(-1)
    end)
  ))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  })

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist({
    screen = s,
    -- filter = awful.widget.tasklist.filter.currenttags,
    filter = awful.widget.tasklist.filter.focused,
    buttons = tasklist_buttons,
    layout = {
      spacing = 10,
      layout = wibox.layout.flex.horizontal,
    },
    widget_template = {
      {
        {
          {
            id = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left = 10,
        right = 10,
        widget = wibox.container.margin,
      },
      id = 'background_role',
      widget = wibox.container.background,
    },
  })

  -- Create the wibox
  s.mywibox = awful.wibar({ position = 'top', screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      s.mytaglist,
      s.mypromptbox,
    },
    { -- Middle widget
      layout = wibox.layout.fixed.horizontal,
      s.mytasklist,
    },
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      mykeyboardlayout,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,
    },
  })
end)
-- }}}
