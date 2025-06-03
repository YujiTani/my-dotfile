local reload = require("reload")

_G.ReloadConfig = reload.reload_config

reload.load_initial_config()
reload.setup_reload_commands()
