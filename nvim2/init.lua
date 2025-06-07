require('mini/mini')
require("options")
require("hooks")
require("keymaps")
require("theme")

-- ou et up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- leaderキー
vim.g.mapleader = ","

-- mini.lua プラグイン
now(function()
  require('mini.icons').setup()
end)

require('mini.basics').setup({
  options = {
    basic = true,
    extra_ui = true,
    win_borders = 'single',
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
    windows = true,
    move_with_alt = true,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = false,
  },
  silent = false,
})

-- helpの日本語化プラグイン
later(function()
  add('https://github.com/vim-jp/vimdoc-ja')
  vim.opt.helplang:prepend('ja')
end)

-- ステータスラインを表示するプラグイン
now(function()
  require('mini.statusline').setup()
  vim.opt.laststatus = 3
  vim.opt.cmdheight = 0
end)

-- カーソル位置が保存するプラグイン
now(function()
  require('mini.misc').setup()
  MiniMisc.setup_restore_cursor()
end)

-- 通知を変更するプラグイン
now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify({
    ERROR = { duration = 10000 }
  })
end)

-- 視認性向上
later(function()
  require('mini.cursorword').setup()
end)

later(function()
  require('mini.indentscope').setup()
end)

later(function()
  require('mini.trailspace').setup()
end)

-- startMenuプラグイン
now(function()
  require('mini.starter').setup()
end)
