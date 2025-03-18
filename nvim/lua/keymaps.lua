-- クリップボード連携のキーマップ

-- 行をクリップボードにコピー
vim.keymap.set('n', '<leader>y', '"+yy', { desc = 'Copy line to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })

-- 行をクリップボードにコピーし、選択範囲を切り取る
vim.keymap.set('n', '<leader>d', '"+dd', { desc = 'Cut line to clipboard' })
vim.keymap.set('v', '<leader>d', '"+d', { desc = 'Cut selection to clipboard' })

vim.keymap.set('n', '<leader>o', '<CMD>Oil --float<CR>', {desc = 'Open Oil file explorer' })

-- Telescopeのキーマップ
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Text Search' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help Tags' })

-- LSPのキーマップ
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show Hover" })


