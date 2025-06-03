-- ¿¿¿¿¿¿¿¿
vim.opt.number = true          -- ¿¿¿¿¿¿
vim.opt.relativenumber = false -- ¿¿¿¿¿¿¿¿
vim.opt.cursorline = true      -- ¿¿¿¿¿¿¿¿¿¿¿
vim.opt.termguicolors = true   -- 24¿¿¿¿¿¿¿¿¿

-- ¿¿¿¿¿¿¿¿¿¿¿
vim.opt.expandtab = true   -- ¿¿¿¿¿¿¿¿¿¿
vim.opt.tabstop = 2        -- ¿¿¿¿2¿¿¿¿¿¿¿
vim.opt.shiftwidth = 2     -- ¿¿¿¿¿¿¿2¿¿¿¿¿¿¿
vim.opt.smartindent = true -- ¿¿¿¿¿¿¿¿¿¿¿¿¿

-- ¿¿¿¿
vim.opt.ignorecase = true -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.opt.smartcase = true  -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.opt.hlsearch = true   -- ¿¿¿¿¿¿¿¿¿¿

-- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.opt.backup = false      -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.opt.writebackup = false -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.opt.swapfile = false    -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.opt.undofile = true     -- ¿¿¿¿undo¿¿¿¿¿¿¿

-- ¿¿¿¿¿¿¿
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

-- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
