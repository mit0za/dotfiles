-- ## Notifications ##
-- ~~~~~~~~~~~~~~~~~~~

-- Requirements :
-- ~~~~~~~~~~~~~~
local menubar = require("menubar")
local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local ruled = require("ruled")
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local naughty = require("naughty")

-- # Libs :
-- ~~~~~~~~
local helpers = require("libs.helpers")

-- Defaults
naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()

naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.title = "Notification"
naughty.config.defaults.margin = 50
naughty.config.defaults.border_width = 0
naughty.config.defaults.position = "top_right"
naughty.config.defaults.max_notifications = 5
naughty.config.icon_dirs = {
	"/usr/share/icons/Papirus-Dark/24x24/apps/",
	"/usr/share/pixmaps/"
}
naughty.config.icon_formats = {"svg", "png", "jpg", "gif"}

-- Timeouts
naughty.config.defaults.timeout = 2
naughty.config.presets.low.timeout      = 1
naughty.config.presets.critical.timeout = 0

-- naughty normal preset
naughty.config.presets.normal = {
    font    = "Roboto Medium 10",
    fg      = colors.brightwhite,
    bg      = colors.container
}

-- naughty low preset
naughty.config.presets.low = {
    font ="Roboto Medium 10",
    fg = colors.brightwhite,
    bg = colors.container
}

-- naughty critical preset
naughty.config.presets.critical = {
    font = "Roboto Bold 12",
    fg = colors.brightred,
    bg = colors.container,
    timeout = 0
}

-- apply preset
naughty.config.presets.ok   =   naughty.config.presets.normal
naughty.config.presets.info =   naughty.config.presets.normal
naughty.config.presets.warn =   naughty.config.presets.critical

-- ruled notification
ruled.notification.connect_signal("request::rules", function()
    ruled.notification.append_rule {
        rule = {},
        properties = {screen = awful.screen.preferred, implicit_timeout = 6}
    }
end)

-- # Error handling :
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

-- connect to each display
-- ~~~~~~~~~~~~~~~~~~~~~~~
naughty.connect_signal("request::display", function(n)

    -- action widget
    local action_widget = {
        {
            {
                id = "text_role",
                align = "center",
                valign = "center",
                font = "Roboto 10",
                widget = wibox.widget.textbox
            },
            left = dpi(6),
            right = dpi(6),
            widget = wibox.container.margin
        },
        bg = colors.container,
        shape = helpers.rrect(dpi(5)),
        widget = wibox.container.background
    }
    -- actions
    local actions = wibox.widget {
        notification = n,
        base_layout = wibox.widget {
            spacing = dpi(8),
            layout = wibox.layout.flex.horizontal
        },
        widget_template = action_widget,
        style = {underline_normal = false, underline_selected = true},
        widget = naughty.list.actions
    }

    -- image
    local image_n = wibox.widget {
    {
        image = n.icon,
        resize = true,
        clip_shape = helpers.rrect(theme.rounded),
        halign = "center",
        valign = "center",
        widget = wibox.widget.imagebox,
    },
    strategy = "exact",
    height = dpi(72),
    width = dpi(72),
    widget = wibox.container.constraint,
    }
    
    -- title
    local title_n = wibox.widget{
        {
            {
                markup      = n.title,
                font        = "Roboto bold 14",
                align       = "left",
                valign      = "center",
                widget      = wibox.widget.textbox
            },
            widget          = wibox.container.scroll.horizontal,
            step_function   = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
            speed           = 50
        },
        margins     = {right = 15},
        widget      = wibox.container.margin
    }

    local message_n = wibox.widget{
        {
            {
                markup      = helpers.colorize_text("<span weight='normal'>" .. n.message .. "</span>", colors.brightwhite),
                font        = "Roboto Medium 11",
                align       = "left",
                valign      = "center",
                wrap        = "char",
                widget      = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal
        },
        margins     = {right = 15},
        widget      = wibox.container.margin
    }

    -- app name
    local app_name_n = wibox.widget{
            markup      = helpers.colorize_text(n.app_name, colors.brightwhite),
            font        = "Roboto Medium 12",
            align       = "left",
            valign      = "center",
            widget      = wibox.widget.textbox
    }

    local time_n = wibox.widget{
        {
            markup      = helpers.colorize_text(os.date "%H:%M", colors.brightwhite),
            font        = "Roboto Medium 12",
            align       = "right",
            valign      = "center",
            widget      = wibox.widget.textbox
        },
        margins = {left = dpi(6)},
        widget  = wibox.container.margin
    }
    
    -- extra info
    local notif_info = wibox.widget{
        app_name_n,
        {
            widget = wibox.widget.separator,
            shape = gears.shape.circle,
            forced_height = dpi(4),
            forced_width = dpi(4),
            color = colors.brightwhite
        },
        time_n,
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(7)
    }
  
    -- init
    naughty.layout.box {
        notification = n,
        type    = "notification",
        bg      = colors.container,
        shape   = helpers.rrect(theme.rounded),
        widget_template = {
			{
				{
					{
						{
							{
								{
									notif_info,
									{
										{
											title_n,
											message_n,
											layout = wibox.layout.fixed.vertical,
											spacing = dpi(3)
										},
										margins = {left = dpi(6)},
										widget = wibox.container.margin
									},
									layout = wibox.layout.fixed.vertical,
									spacing = dpi(16)
								},
								nil,
								image_n,
								layout = wibox.layout.align.horizontal,
								expand = "none"
							},
							{
								{actions, layout = wibox.layout.fixed.vertical},
								margins = {top = dpi(20)},
								visible = n.actions and #n.actions > 0,
								widget = wibox.container.margin
							},
							layout = wibox.layout.fixed.vertical,
						},
						margins = dpi(18),
						widget = wibox.container.margin
					},
					strategy = "max",
					width = dpi(500),
					widget = wibox.container.constraint,
				},
				strategy = "min",
				width = dpi(200),
				height = dpi(80),
				widget = wibox.container.constraint,
            },
            shape           = helpers.rrect(theme.rounded),
            widget          = wibox.container.background,
        },
    }
end)
