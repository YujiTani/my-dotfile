-- lua/plugins/lsp.lua
-- LSP関連の設定
return {
  -- LSPサーバーのインストールと管理
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- mason.nvimとlspconfigの連携
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver", -- TypeScript
          "eslint", -- ESLint
          "solargraph", -- Ruby
          "lua_ls", -- Lua
          "jdtls", -- Java
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSPの設定
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- LSPソースを補完に連携
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 全サーバー共通のcapabilities設定
      vim.lsp.config("*", { capabilities = capabilities })

      -- TypeScript
      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- Ruby (Solargraph)
      vim.lsp.config("solargraph", {
        settings = {
          solargraph = {
            diagnostics = true,
          },
        },
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Java (jdtls)
      -- JDKのパス確認方法: ターミナルで `/usr/libexec/java_home -V` を実行
      -- 例: /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
      vim.lsp.config("jdtls", {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-21",
                  path = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",
                  default = true, -- デフォルトで使用するJDK
                },
                {
                  name = "JavaSE-25",
                  path = "/Users/yuzunosk/Library/Java/JavaVirtualMachines/openjdk-25/Contents/Home",
                },
              },
            },
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            inlayHints = { parameterNames = { enabled = "all" } },
          },
        },
      })

      vim.lsp.enable({ "ts_ls", "eslint", "solargraph", "lua_ls", "jdtls" })

      -- LSPキーマッピング（共通）
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local base_opts = { buffer = ev.buf }
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", base_opts, { desc = desc }))
          end

          map("n", "gD", vim.lsp.buf.declaration, "宣言へジャンプ")
          map("n", "gd", vim.lsp.buf.definition, "定義へジャンプ")
          map("n", "K", vim.lsp.buf.hover, "カーソル位置の情報を表示")
          map("n", "gi", vim.lsp.buf.implementation, "実装へジャンプ")
          map("n", "<C-k>", vim.lsp.buf.signature_help, "関数シグネチャを表示")
          map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "ワークスペースにフォルダを追加")
          map(
            "n",
            "<leader>wr",
            vim.lsp.buf.remove_workspace_folder,
            "ワークスペースからフォルダを削除"
          )
          map("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, "ワークスペースフォルダ一覧を表示")
          map("n", "<leader>D", vim.lsp.buf.type_definition, "型定義へジャンプ")
          map("n", "<leader>rn", vim.lsp.buf.rename, "シンボル名を変更")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "コードアクションを表示")
          map("n", "gr", vim.lsp.buf.references, "参照箇所を検索")
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "フォーマッターで整形")
        end,
      })
    end,
  },

  -- LSP UI改善
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = true,
        },
        symbol_in_winbar = {
          enable = true,
        },
        ui = {
          border = "rounded",
        },
      })

      -- LSPSagaのキーマッピング
      vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { desc = "定義/参照/実装を統合表示" })
      vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "LSPSagaのコードアクション" })
      vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "LSPSagaでリネーム" })
      vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", { desc = "定義をプレビュー表示" })
      vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "アウトラインを表示" })
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "ホバードキュメントを表示" })
    end,
  },
}
