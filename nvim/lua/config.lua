-- 真真真真
vim.opt.number = true          -- 真真真
vim.opt.relativenumber = false -- 真真真真
vim.opt.cursorline = true      -- 真真真真真�
vim.opt.termguicolors = true   -- 24真真真真�

-- 真真真真真�
vim.opt.expandtab = true   -- 真真真真真
vim.opt.tabstop = 2        -- 真真2真真真�
vim.opt.shiftwidth = 2     -- 真真真�2真真真�
vim.opt.smartindent = true -- 真真真真真真�

-- 真真
vim.opt.ignorecase = true -- 真真真真真真真真
vim.opt.smartcase = true  -- 真真真真真真真真真真真
vim.opt.hlsearch = true   -- 真真真真真

-- 真真真真真真真真真真真真
vim.opt.backup = false      -- 真真真真真真真真
vim.opt.writebackup = false -- 真真真真真真真真真
vim.opt.swapfile = false    -- 真真真真真真真
vim.opt.undofile = true     -- 真真undo真真真�

-- 真真真�
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,

  float = {
    show_header = true,
    source = "always",
    border = "rounded",
  },
})

-- 真真真真真真真真真真真
vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
