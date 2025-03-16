return {
  "OlegGulevskyy/better-ts-errors.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  ft = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
  },
  opts = {
    auto_open = true,         -- エラー発生時に自動的にウィンドウを開く
    enabled = true,           -- プラグインを有効化
    keymaps = {
      toggle = "<leader>dd",  -- エラー表示のトグル
      go_to_definition = "gd" -- エラー定義にジャンプ
    }
  }
}
