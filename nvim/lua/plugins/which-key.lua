return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = { enabled = false },
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		window = {
			border = "rounded",
			padding = { 2, 2, 2, 2 },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- 新しい形式でグループを登録
		wk.register({
			f = { name = "ファイル/検索", _ = "which_key_ignore" },
			g = { name = "Git", _ = "which_key_ignore" },
			l = { name = "LSP", _ = "which_key_ignore" },
		}, { prefix = "<leader>" })
	end,
	keys = {
		{ "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps" },
	},
}

