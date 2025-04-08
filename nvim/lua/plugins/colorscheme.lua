-- plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 高い優先度で最初に読み込む
    lazy = false,    -- 遅延読み込みせず、起動時に読み込む
    opts = {
      -- カスタム設定
      flavour = "macchiato", -- latte, frappe, macchiato, mocha から選択
      background = {
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = true, -- 背景を透過するか
      term_colors = true,            -- ターミナルの色も設定
      dim_inactive = {
        enabled = false,             -- 非アクティブウィンドウを暗くするか
        shade = "dark",
        percentage = 0.15,
      },
      styles = { -- 各シンタックスグループのスタイル設定
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},   -- カラーパレットの上書き
      custom_highlights = {}, -- カスタムハイライトグループ
      integrations = {        -- 他のプラグインとの統合設定
        cmp = true,           -- nvim-cmp
        gitsigns = true,      -- gitsigns.nvim
        nvimtree = true,      -- nvim-tree
        telescope = true,     -- telescope.nvim
        treesitter = true,    -- nvim-treesitter
        notify = true,        -- nvim-notify
        which_key = true,     -- which-key.nvim
        -- さらに多くのプラグイン統合がサポートされています
        -- 詳細は公式ドキュメントを参照: https://github.com/catppuccin/nvim#integrations
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- カラースキームを適用
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
