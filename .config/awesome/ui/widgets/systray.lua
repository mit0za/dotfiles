-- ## Systray ##
-- ~~~~~~~~~~~~~

-- Requirements :
-- ~~~~~~~~~~~~~~
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi


-- Systray
local systray = wibox.widget {
	visible = true,
	base_size = dpi(30),
	horizontal = true,
	screen = 'primary',
	{
		{
			wibox.widget.systray,
			layout = wibox.layout.fixed.horizontal,
		},
		margins = {top = dpi(8), bottom = dpi(8), left = dpi(2), right = dpi(2)},
		widget = wibox.container.margin,
	},
	margins = {top = dpi(2), bottom = dpi(2)},
	widget = wibox.container.margin,
}

return systray
