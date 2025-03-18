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
    auto_open = true,
    enabled = true,
    keymaps = {
      toggle = "<leader>dd",
      go_to_definition = "gd"
    }
  }
}
