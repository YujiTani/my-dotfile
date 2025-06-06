-- help検索コマンド :h autocmd-events
vim.api.nvim_create_user_command(
        'InitLua',
        function()
                vim.cmd.edit(vim.fn.stdpath('config') .. '/init.lua')
        end,
        { desc = 'Open init.lua'}
)

vim.api.nvim_create_user_command(
  'Keyconf',
  function()
    vim.cmd.edit(vim.fn.stdpath('config') .. '/lua/keymaps.lua')
  end,
  { desc = 'Open keymaps.lua' }
)

vim.api.nvim_create_user_command(
  'Hooksconf',
  function()
    vim.cmd.edit(vim.fn.stdpath('config') .. '/lua/hooks.lua')
  end,
  { desc = 'Open hooks.lua' }
)


local augroup = vim.api.nvim_create_augroup('init.lua', {})

local function create_autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, vim.tbl_extend('force', {
    group = augroup,
  },
  opts
  ))
end

-- https://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(event)
    local dir = vim.fs.dirname(event.file)
    local force = vim.v.cmdbang == 1
    if vim.fn.isdirectory(dir) == 0
        and (force or vim.fn.confirm('"' .. dir .. '" does not exist. Create?', "&Yes\n&No") == 1) then
      vim.fn.mkdir(vim.fn.iconv(dir, vim.opt.encoding:get(), vim.opt.termencoding:get()), 'p')
    end
  end,
  desc = 'Auto mkdir to save file'
})
