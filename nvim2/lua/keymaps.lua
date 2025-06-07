vim.keymap.set('n', 'p', 'p`]', { desc = 'Paste and move to the end'})
vim.keymap.set('n', 'P', 'P`]', { desc = 'Paste and move to the end'})

vim.keymap.set(
  'n',
  '<space>q',
  function()
    if not pcall(vim.cmd.tabclose) then vim.cmd.quit()
    end
  end,
  { desc = 'Quit current tab or window' }
)

-- 検索結果をクリア
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
