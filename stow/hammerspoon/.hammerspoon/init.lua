stackline = require "stackline"
stackline:init()


-- Ensure the IPC command line client is available
hs.ipc.cliInstall()

stackline.config:set('paths.yabai', '/opt/homebrew/bin/yabai')