return {
	{
		"petertriho/nvim-scrollbar",
		event = "BufReadPost",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"kevinhwang91/nvim-hlslens",
		},
		config = function()
			require("scrollbar").setup({
				show = true,
				handle = {
					text = " ",
					color = "#504945",
					hide_if_all_visible = true,
				},
				marks = {
					Search = { color = "#fabd2f" },
					Error = { color = "#fb4934" },
					Warn = { color = "#fe8019" },
					Info = { color = "#83a598" },
					Hint = { color = "#8ec07c" },
					Misc = { color = "#d3869b" },
				},
			})
		end,
	},
}
