-- lua/plugins/null-ls.lua
return {
  "nvimtools/none-ls.nvim", -- null-lsの新しいフォーク（推奨）
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = false,
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--indent-type", "Spaces",
            "--indent-width", "2",
            "--quote-style", "AutoPreferDouble",
          },
        }),

        -- TypeScript/JavaScript (お使いの場合)
        null_ls.builtins.formatting.prettier,

        -- Ruby (お使いの場合)
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,

        -- 必要に応じて他のフォーマッターやリンターを追加
      },
    })

    -- 保存時に自動フォーマット
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
