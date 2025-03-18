return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs                        = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signs_staged                 = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signs_staged_enable          = true,
			signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir                 = {
				follow_files = true
			},
			auto_attach                  = true,
			attach_to_untracked          = false,
			current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts      = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
			sign_priority                = 6,
			update_debounce              = 100,
			status_formatter             = nil, -- Use default
			max_file_length              = 40000, -- Disable if file is longer than this (in lines)
			preview_config               = {
				-- Options passed to nvim_open_win
				border = 'single',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach                    = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "次のHunk")
				map("n", "[h", gs.prev_hunk, "前のHunk")
				-- Actions
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Hunkをステージ")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Hunkをリセット")
				map("n", "<leader>hS", gs.stage_buffer, "バッファをステージ")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Hunkのステージを取り消し")
				map("n", "<leader>hR", gs.reset_buffer, "バッファをリセット")
				map("n", "<leader>hp", gs.preview_hunk, "Hunkをプレビュー")
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "行のblame表示")
				map("n", "<leader>hd", gs.diffthis, "差分表示")
				map("n", "<leader>hD", function() gs.diffthis("~") end, "チルダと差分表示")
				map("n", "<leader>tb", gs.toggle_current_line_blame, "行blame表示の切替")
				map("n", "<leader>td", gs.toggle_deleted, "削除表示の切替")
			end,
		},
	},
}
