require("lazy_setup")
require('keymaps')

-- 診断表示の設定
-- LSP（言語サーバープロトコル）からの診断情報（エラー、警告など）の表示方法を設定
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = false,

-- 代替方法として浮動ウィンドウに表示
  float = {
    show_header = true,
    source = 'always',
    border = 'rounded',
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
    }
})

