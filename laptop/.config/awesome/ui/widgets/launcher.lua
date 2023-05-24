-- ## Launcher ##
-- ~~~~~~~~~~~~~~

-- Requirements :
-- ~~~~~~~~~~~~~~
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi
local sidebar = require("ui.sidebar")

-- # Libs :
-- ~~~~~~~~
local helpers = require("libs.helpers")

-- launcher :
local launcher = wibox.widget {
  widget = wibox.widget.textbox,
  font = theme.ui_font,
  markup = helpers.colorize_text(" ", colors.main_scheme),
  align = "center",
  valign = "center",
}

--launcher:buttons(gears.table.join({
--	awful.button({ }, 1, function ()
--		awful.spawn.with_shell(require("libs.misc").rofiCommand, false)
--	end)
--
--}))

launcher:connect_signal(
  "button::press",
  function()
    launcher.opacity = 0.6
    sidebar.toggle(s)
  end)
launcher:connect_signal(
  "button::release",
  function()
    launcher.opacity = 1
  end)


--return awful.widget.only_on_screen(launcher, 'primary')
return launcher
