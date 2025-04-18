-- lazy.nvimをブートストラップする（自動インストール処理）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- vim.uv（新しいAPI）またはvim.loop（古いAPI）を使ってファイルの存在を確認
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  
  -- gitコマンドを実行してlazy.nvimをクローン
  -- --filter=blob:none オプションで必要なファイルのみを取得（高速化）
  -- --branch=stable オプションで安定版ブランチを使用
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  
  -- gitコマンドが失敗した場合のエラーハンドリング
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    
    -- キー入力を待機
    vim.fn.getchar()
    
    -- Neovimを終了（エラーコード1）
    os.exit(1)
  end
end

-- runtimepathにlazy.nvimを追加（最優先で読み込む）
vim.opt.rtp:prepend(lazypath)

-- リーダーキーをカンマに設定
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- lazy.nvimの初期化とプラグイン設定
require("lazy").setup({
  -- プラグイン仕様をどこから読み込むかを指定
  spec = {
    { import = "plugins" },  -- lua/plugins/以下のLuaファイルからプラグイン設定を読み込む
  },
  
  -- プラグインのアップデートチェッカーを有効化
  -- Neovim起動時に新しいバージョンがあるか確認してくれる
  checker = { enabled = true },
})
