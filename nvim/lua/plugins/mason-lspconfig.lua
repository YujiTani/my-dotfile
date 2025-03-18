return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- 他に必要な言語サーバーをここに追加
      },
      automatic_installation = true,
    })

    local lsp_utils = require("plugins.lsp.utils")


    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local has_custom_config, server_config = pcall(require, "plugins.lsp.servers." .. server_name)
        local config = {
          on_attach = lsp_utils.on_attach,
        }
        if has_custom_config then
          for k, v in pairs(server_config) do
            config[k] = v
          end
        end
        require("lspconfig")[server_name].setup(config)
      end,
    })
 end
}
