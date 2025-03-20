return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		spec = {
			{
				mode = { "n", "v" },
				["<leader>f"] = { name = "ファイル/検索" }, -- telescope, oil関連
				["<leader>g"] = { name = "Git" }, -- gitsigns, lazygit関連
				["<leader>l"] = { name = "LSP" }, -- lsp関連の操作
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
