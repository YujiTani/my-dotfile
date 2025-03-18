return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- "storm", "moon", "night", "day"から選択
    transparent = false, -- 完全な透明化をオフにする
    transparent_background = true, -- 半透明背景の有効化
    background_colour = "111111", -- 背景色のHEX値 (暗さを調整)
    terminal_colors = true,
  },
  config = function()
    vim.cmd[[colorscheme tokyonight]]
  end,
}
