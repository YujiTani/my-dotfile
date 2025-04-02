return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local format_options = {
      tabSize = 2,
      insertSpaces = true,
      trimTrailingWhitespace = true,
      insertFinalNewline = true,
      trimFinalNewlines = true,
    }

    local function debug_format(bufnr, client_name)
      vim.notify("Formatting buffer " .. bufnr .. " with " .. client_name, vim.log.levels.INFO)
    end

    local function on_attach(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
          buffer = bufnr,
          callback = function()
            debug_format(bufnr, client.name)
            vim.lsp.buf.format({
              timeout_ms = 3000,
              bufnr = bufnr,
              formatting_options = format_options,
            })
          end,
        })
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show Hover" })
      vim.keymap.set("n", "gb", "<C-o>", { buffer = bufnr, desc = "Go Back" })
    end

    local function setup_diagnostics()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end

    local function get_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- フォーマット設定をサポートする機能を有効化
      capabilities.textDocument.formatting = true
      capabilities.textDocument.rangeFormatting = true
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      return require("cmp_nvim_lsp").default_capabilities(capabilities)
    end
    -- 診断設定を初期化
    setup_diagnostics()

    -- Mason-lspconfig の設定
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        -- 他に必要な言語サーバーをここに追加
      },
      automatic_installation = true,
    })

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local has_custom_config, server_config = pcall(require,
          "plugins.lsp.servers." .. server_name)
        local config = {
          on_attach = on_attach,
          capabilities = get_capabilities(),
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
