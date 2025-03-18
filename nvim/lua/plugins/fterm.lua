return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")
		fterm.setup({
			border = 'double',
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})
		vim.keymap.set('n', '<C-\\>', fterm.toggle, { desc = 'Toggle terminal' })
		vim.keymap.set('t', '<C-\\>', fterm.toggle, { desc = 'Toggle terminal' })
		local lazygit = fterm:new({
			ft = 'fterm_lazygit',
			cmd = "lazygit",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})
		vim.keymap.set('n', '<leader>g', function()
			lazygit:toggle()
		end, { desc = 'Toggle lazygit' })
		vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, { bang = true })
		vim.api.nvim_create_user_command('Lazygit', function() lazygit:toggle() end, { bang = true })
	end,
}
