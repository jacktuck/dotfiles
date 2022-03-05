stackline = require "stackline"
stackline:init()

hs.ipc.cliInstall()

-- prefs
hs.autoLaunch(true)
hs.menuIcon(false)

brew_prefix = string.gsub(hs.execute("brew --prefix", true), '[\r\n]+', '')

stackline.config:set('paths.yabai', brew_prefix  .. "/bin/yabai")