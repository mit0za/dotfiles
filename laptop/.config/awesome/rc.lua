-- Standard awesome library
pcall(require, "luarocks.loader")
require("awful.autofocus")
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

-- # Themes :
local theme = require("themes")
beautiful.init(theme)
awful.spawn.with_shell("feh --bg-fill $HOME/.config/awesome/wallpaper.jpg")

-- ### Configurations ### --

-- # Keybindings :
require("configurations.keybindings")

-- # Layouts :
require("configurations.layouts")

-- # Rules :
require("configurations.rules")

-- # Signals :
require("signals")

-- ### UI ### --

-- # Notifications :
require("ui.notifications")

-- # Titlebars :
require("ui.titlebar")

-- # Menu :
require("ui.menu")

-- # Bar :
require("ui.bar")


-- Autorun at startup
awful.spawn.with_shell("bash ~/.config/awesome/configurations/autostart")

--- Enable for lower memory consumption
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
