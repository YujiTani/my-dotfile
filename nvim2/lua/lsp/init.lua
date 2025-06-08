-- lua/lsp/init.lua
vim.api.nvim_create_user_command(
  'LspHealth',
  'checkhealth vim.lsp',
  { desc = 'LSP health check' })

vim.diagnostic.config({
  virtual_text = true
})

local augroup = vim.api.nvim_create_augroup('lsp/init.lua', {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method('textDocument/definition') then
      -- 定義ジャンプの設定（省略）
    end

    if client:supports_method('textDocument/formatting') then
      -- フォーマットの設定（省略）
    end

    vim.keymap.set('n', 'grd', function()
      vim.lsp.buf.definition()
    end, { buffer = args.buf, desc = 'vim.lsp.buf.definition()' })

    vim.keymap.set('n', '<leader>i', function()
      vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
    end, { buffer = args.buf, desc = 'Format buffer' })
  end,
})

vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = require('mini.completion').get_lsp_capabilities(),
})

-- 設定オブジェクトを取得して適用
local lua_ls_opts = require('lsp.lua_ls')
vim.lsp.config('lua_ls', lua_ls_opts)
vim.lsp.enable('lua_ls')
