require("config.lazy")
require('keymaps')

-- init.lua または init.vim 内に追加
vim.diagnostic.config({
  virtual_text = true, -- インラインのエラーメッセージを非表示
  signs = true,        -- 行番号の横のアイコンは表示したままにする場合
  underline = true,    -- エラー箇所の下線は表示したままにする場合
  update_in_insert = false,
})
