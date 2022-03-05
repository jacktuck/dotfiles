stackline = require "stackline"
stackline:init()

-- Ensure the IPC command line client is available
hs.ipc.cliInstall()


brew_prefix = string.gsub(hs.execute("brew --prefix", true), '[\r\n]+', '')

stackline.config:set('paths.yabai', brew_prefix  .. "/bin/yabai")