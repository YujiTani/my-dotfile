-- help検索コマンド :h autocmd-events

-- file移動ショートカット
vim.api.nvim_create_user_command(
        'InitLua',
        function()
                vim.cmd.edit(vim.fn.stdpath('config') .. '/init.lua')
        end,
        { desc = 'Open init.lua'}
)

vim.api.nvim_create_user_command(
  'Keymapconf',
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

vim.api.nvim_create_user_command(
  'Optionsconf',
  function()
    vim.cmd.edit(vim.fn.stdpath('config') .. '/lua/options.lua')
  end,
  { desc = 'Open options.lua' }
)


local augroup = vim.api.nvim_create_augroup('init.lua', {})

function create_autocmd(event, opts)
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

-- require('mini.statusline').setup()と同じlaterの中に追加
create_autocmd({ 'RecordingEnter', 'CmdlineEnter' }, {
  pattern = '*',
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
create_autocmd('RecordingLeave', {
  pattern = '*',
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
create_autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.reg_recording() == '' then
      vim.opt.cmdheight = 0
    end
  end,
})

