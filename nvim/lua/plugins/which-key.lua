return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["<leader>f"] = { name = "ファイル" },
			["<leader>g"] = { name = "Git" },
			["<leader>h"] = { name = "ヘルプ/ハイライト" },
			["<leader>l"] = { name = "LSP" },
			["<leader>s"] = { name = "検索" },
			["<leader>t"] = { name = "トグル/テスト" },
			["<leader>w"] = { name = "ウィンドウ" },
			["<leader>x"] = { name = "診断/修正" },
		},
		window = {
			border = "single",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 2, 1, 2 },
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "center",
		},
		triggers_nowait = {
			"z=",
		},
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
