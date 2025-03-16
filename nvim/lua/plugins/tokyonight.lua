-- lua/plugins/tokyonight.lua
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,  -- 高い優先度で読み込まれるようにする
  opts = {
    -- オプション設定（お好みで調整可能）
    style = "night", -- "storm", "moon", "night", "day"から選択
    transparent = false, -- 背景を透明にする場合はtrue
    terminal_colors = true, -- ターミナルの色も設定
  },
  config = function()
    -- テーマ適用
    vim.cmd[[colorscheme tokyonight]]
  end,
}
