return {
	{
		"hrsh7th/nvim-cmp",
		version = false, -- 最新版を使用
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSPソース
			"hrsh7th/cmp-buffer", -- バッファ内の単語
			"hrsh7th/cmp-path", -- ファイルパス
			"hrsh7th/cmp-cmdline", -- コマンドライン
			"saadparwaiz1/cmp_luasnip", -- スニペット
			{
				"L3MON4D3/LuaSnip", -- スニペットエンジン
				build = "make install_jsregexp",
				dependencies = {
					"rafamadriz/friendly-snippets", -- 一般的なスニペット集
				},
			},
			"onsails/lspkind.nvim", -- アイコン表示
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- friendly-snippets の読み込み
			require("luasnip.loaders.from_vscode").lazy_load()

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- 選択した候補を確定
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- 選択した候補で置換
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip",  priority = 750 },
					{ name = "buffer",   priority = 500 },
					{ name = "path",     priority = 250 },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							-- 表示を短くする
							if vim_item.abbr:len() > 50 then
								vim_item.abbr = vim_item.abbr:sub(1, 50) .. "..."
							end
							return vim_item
						end,
					}),
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				window = {
					completion = cmp.config.window.bordered({
						winhighlight =
						"Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight =
						"Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					}),
				},
			}
		end,
	},

	-- コマンドライン補完の設定
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.cmdline = {
				enable = true,
				options = {
					{
						type = ":",
						mapping = cmp.mapping.preset.cmdline(),
						sources = cmp.config.sources({
							{ name = "path" },
							{ name = "cmdline" },
						}),
					},
					{
						type = { "/", "?" },
						mapping = cmp.mapping.preset.cmdline(),
						sources = {
							{ name = "buffer" },
						},
					},
				},
			}
		end,
	},
}
