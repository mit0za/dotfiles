-- ## Layoutbox ##
-- ~~~~~~~~~~~~~~~

-- Requirements :
-- ~~~~~~~~~~~~~~
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

return function(s)
	-- Create a layoutbox widget
    local layoutbox = awful.widget.layoutbox
    {
        screen  = s,
        buttons = 
        {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }
    layoutbox = wibox.container.margin(layoutbox, dpi(2), dpi(2), dpi(11), dpi(11))
	return layoutbox
end
