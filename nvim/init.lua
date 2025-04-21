require("lazy_setup")
require("keymaps")

-- 基本的な表示設定
vim.opt.number = true -- 行番号を表示
vim.opt.relativenumber = false -- 相対行番号を表示
vim.opt.cursorline = true -- カーソル行をハイライト
vim.opt.termguicolors = true -- 24ビットカラーを使用

-- インデントとタブの設定
vim.opt.expandtab = true -- タブをスペースに変換
vim.opt.tabstop = 2 -- タブ幅を2スペースに設定
vim.opt.shiftwidth = 2 -- インデント幅を2スペースに設定
vim.opt.smartindent = true -- スマートインデントを有効化

-- 検索設定
vim.opt.ignorecase = true -- 検索時に大文字小文字を区別しない
vim.opt.smartcase = true -- 検索パターンに大文字が含まれる場合は区別する
vim.opt.hlsearch = true -- 検索結果をハイライト

-- ファイル関連の設定
vim.opt.backup = false -- バックアップファイルを作成しない
vim.opt.swapfile = false -- スワップファイルを作成しない
vim.opt.undofile = true -- 永続的なundoの履歴を有効化

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
    source = "always",
    border = "rounded",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})

-- リロード用のグローバル関数を定義
_G.ReloadModule = function(module_name)
  package.loaded[module_name] = nil
  return require(module_name)
end

-- コマンドを作成
vim.api.nvim_create_user_command("R", function(opts)
  if opts.args == "" then
    vim.cmd("source $MYVIMRC")
    print("Reloaded MYVIMRC")
  else
    ReloadModule(opts.args)
    print("Reloaded " .. opts.args)
  end
end, { nargs = "?" })

-- 特定のファイルタイプに対する自動リロード
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/nvim/lua/**/*.lua",
  callback = function(args)
    local file = vim.fn.fnamemodify(args.file, ":p:.")
    local module = file:gsub("%.lua$", ""):gsub("/", "."):gsub("lua%.", "")
    if package.loaded[module] then
      package.loaded[module] = nil
      require(module)
      print("Auto-reloaded " .. module)
    end
  end,
})

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("w")
  local file = vim.fn.expand("%:p:.")
  local module = file:gsub("%.lua$", ""):gsub("/", "."):gsub("lua%.", "")
  if package.loaded[module] then
    package.loaded[module] = nil
    require(module)
    print("Reloaded " .. module)
  else
    vim.cmd("source %")
    print("Sourced " .. file)
  end
end, { desc = "Save and reload current file" })
