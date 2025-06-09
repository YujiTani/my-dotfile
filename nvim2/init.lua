require('mini/mini')
require("options")
require("hooks")
require("keymaps")
require("theme")

-- ou et up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add('neovim/nvim-lspconfig')
require("lsp")

-- leaderキー
vim.g.mapleader = ","

-- mini.lua プラグイン
now(function()
  require('mini.icons').setup()
end)

require('mini.basics').setup({
  options = {
    basic = true,
    extra_ui = true,
    win_borders = 'single',
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
    windows = true,
    move_with_alt = true,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = false,
  },
  silent = false,
})

-- helpの日本語化プラグイン
later(function()
  add('https://github.com/vim-jp/vimdoc-ja')
  vim.opt.helplang:prepend('ja')
end)

-- ステータスラインを表示するプラグイン
now(function()
  require('mini.statusline').setup()
  vim.opt.laststatus = 3
  vim.opt.cmdheight = 0
end)

-- カーソル位置が保存するプラグイン
now(function()
  require('mini.misc').setup()
  MiniMisc.setup_restore_cursor()
end)

-- 通知を変更するプラグイン
now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify({
    ERROR = { duration = 10000 }
  })
end)

-- 視認性向上
later(function()
  require('mini.cursorword').setup()
end)

later(function()
  require('mini.indentscope').setup()
end)

later(function()
  require('mini.trailspace').setup()
end)

-- StartMenuにsession追加
now(function()
  require('mini.sessions').setup()
end)

-- StartMenuに直近使用ファイルを呼び出し
now(function()
  require('mini.starter').setup()
end)

-- 括弧・クォート編集支援系
later(function()
  require('mini.pairs').setup()
end)

--括弧変換
later(function()
  require('mini.surround').setup()
end)

-- キーマップ表示プラグイン
later(function()
  local function mode_nx(keys)
    return { mode = 'n', keys = keys }, { mode = 'x', keys = keys }
  end
  local clue = require('mini.clue')
  clue.setup({
    triggers = {
      -- Leader triggers
      mode_nx('<leader>'),

      -- Built-in completion
      { mode = 'i', keys = '<c-x>' },

      -- `g` key
      mode_nx('g'),

      -- Marks
      mode_nx("'"),
      mode_nx('`'),

      -- Registers
      mode_nx('"'),
      { mode = 'i', keys = '<c-r>' },
      { mode = 'c', keys = '<c-r>' },

      -- Window commands
      { mode = 'n', keys = '<c-w>' },

      -- bracketed commands
      { mode = 'n', keys = '[' },
      { mode = 'n', keys = ']' },

      -- `z` key
      mode_nx('z'),

      -- surround
      mode_nx('s'),

      -- text object
      { mode = 'x', keys = 'i' },
      { mode = 'x', keys = 'a' },
      { mode = 'o', keys = 'i' },
      { mode = 'o', keys = 'a' },

      -- option toggle (mini.basics)
      { mode = 'n', keys = 'm' },
    },

    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      clue.gen_clues.builtin_completion(),
      clue.gen_clues.g(),
      clue.gen_clues.marks(),
      clue.gen_clues.registers({ show_contents = true }),
      clue.gen_clues.windows({ submode_resize = true, submode_move = true }),
      clue.gen_clues.z(),
    },
  })
end)

-- 自動補完のプラグイン
later(function()
  require('mini.fuzzy').setup()
  require('mini.completion').setup({
    lsp_completion = {
      process_items = MiniFuzzy.process_lsp_items,
    },
  })
  require('mini.snippets').setup({
    mappings = {
      jump_prev = '<c-k>',
    },
  })

  -- improve fallback completion
  vim.opt.complete = { '.', 'w', 'k', 'b', 'u' }
  vim.opt.completeopt:append('fuzzy')
  vim.opt.dictionary:append('/usr/share/dict/words') -- 注意1

  -- define keycodes
  local keys = {
    cn = vim.keycode('<c-n>'),
    cp = vim.keycode('<c-p>'),
    ct = vim.keycode('<c-t>'),
    cd = vim.keycode('<c-d>'),
    cr = vim.keycode('<cr>'),
    cy = vim.keycode('<c-y>'),
  }

  -- select by <tab>/<s-tab>
  vim.keymap.set('i', '<tab>', function()
    -- popup is visible -> next item
    -- popup is NOT visible -> add indent
    return vim.fn.pumvisible() == 1 and keys.cn or keys.ct
  end, { expr = true, desc = 'Select next item if popup is visible' })
  vim.keymap.set('i', '<s-tab>', function()
    -- popup is visible -> previous item
    -- popup is NOT visible -> remove indent
    return vim.fn.pumvisible() == 1 and keys.cp or keys.cd
  end, { expr = true, desc = 'Select previous item if popup is visible' })

  -- complete by <cr>
  vim.keymap.set('i', '<cr>', function()
    if vim.fn.pumvisible() == 0 then
      -- popup is NOT visible -> insert newline
      return require('mini.pairs').cr() -- 注意2
    end
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    if item_selected then
      -- popup is visible and item is selected -> complete item
      return keys.cy
    end
    -- popup is visible but item is NOT selected -> hide popup and insert newline
    return keys.cy .. keys.cr
  end, { expr = true, desc = 'Complete current item if item is selected' })
end)

-- バッファ支援
later(function()
  require('mini.tabline').setup()
end)

-- バッファを削除する関数
later(function()
  require('mini.bufremove').setup()

  vim.api.nvim_create_user_command(
    'Bufdelete',
    function()
      MiniBufremove.delete()
    end,
    { desc = 'Remove buffer' }
  )
end)

-- ファイラープラグイン
now(function()
  require('mini.files').setup()

  vim.api.nvim_create_user_command(
    'Files',
    function()
      MiniFiles.open()
    end,
    { desc = 'Open file exproler' }
  )
end)

-- Fuzzy Finderモジュール
later(function()
  require('mini.pick').setup()

  vim.ui.select = MiniPick.ui_select

  -- ファイルピッカーを開く
  vim.keymap.set('n', '<leader>f', function()
    MiniPick.builtin.files({ tool = 'git' })
  end, { desc = 'mini.pick.files' })
  -- バッファ選択・削除機能（Space+b）
  vim.keymap.set('n', '<leader>b', function()
    local wipeout_cur = function()
      vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
    end
    local buffer_mappings = { wipeout = { char = '<c-d>', func = wipeout_cur } }
    MiniPick.builtin.buffers({ include_current = false }, { mappings = buffer_mappings })
  end, { desc = 'mini.pick.buffers' })
  -- 訪問履歴機能（Space+h）
  require('mini.visits').setup()
  vim.keymap.set('n', '<leader>h', function()
    require('mini.extra').pickers.visit_paths()
  end, { desc = 'mini.extra.visit_paths' })
  -- ヘルプファインダー
  vim.keymap.set('c', 'h', function()
    if vim.fn.getcmdtype() .. vim.fn.getcmdline() == ':h' then
      return '<c-u>Pick help<cr>'
    end
    return 'h'
  end, { expr = true, desc = 'mini.pick.help' })
end)

-- SessionWrite時にtabキーでsession select
local function is_blank(arg)
  return arg == nil or arg == ''
end
local function get_sessions(lead)
  -- ref: https://qiita.com/delphinus/items/2c993527df40c9ebaea7
  return vim
      .iter(vim.fs.dir(MiniSessions.config.directory))
      :map(function(v)
        local name = vim.fn.fnamemodify(v, ':t:r')
        return vim.startswith(name, lead) and name or nil
      end)
      :totable()
end
vim.api.nvim_create_user_command('SessionWrite', function(arg)
  local session_name = is_blank(arg.args) and vim.v.this_session or arg.args
  if is_blank(session_name) then
    vim.notify('No session name specified', vim.log.levels.WARN)
    return
  end
  vim.cmd('%argdelete')
  MiniSessions.write(session_name)
end, { desc = 'Write session', nargs = '?', complete = get_sessions })

-- SessionDeleteコマンド追加
vim.api.nvim_create_user_command('SessionDelete', function(arg)
  MiniSessions.select('delete', { force = arg.bang })
end, { desc = 'Delete session', bang = true })

-- 保存済みのSession呼び出し
vim.api.nvim_create_user_command('SessionLoad', function()
  MiniSessions.select('read', { verbose = true })
end, { desc = 'Load session' })

-- セッション離脱コマンド追加
vim.api.nvim_create_user_command('SessionEscape', function()
  vim.v.this_session = ''
end, { desc = 'Escape session' })

-- 現在のSession表示
vim.api.nvim_create_user_command('SessionReveal', function()
  if is_blank(vim.v.this_session) then
    vim.print('No session')
    return
  end
  vim.print(vim.fn.fnamemodify(vim.v.this_session, ':t:r'))
end, { desc = 'Reveal session' })


-- Git関連の設定（mini.diff + mini.git）
now(function()
  require('mini.diff').setup({
    view = {
      style = 'sign',
      signs = { add = '+', change = '~', delete = '-' },
    },
  })
end)

-- デフォルトのf tによる移動を強化
later(function()
  require('mini.jump').setup({
    delay = {
      idle_stop = 10,
    },
  })
end)

-- nvim-tree-sitter
later(function()
  add({
    source = 'https://github.com/nvim-treesitter/nvim-treesitter',
    hooks = {
      post_checkout = function()
        vim.cmd.TSUpdate()
      end
    },
  })
  ---@diagnostic disable-next-line: missing-fields
  require('nvim-treesitter.configs').setup({
    -- auto-install parsers
    ensure_installed = { 'lua', 'vim', 'tsx' },
    highlight = { enable = true },
  })
end)

-- Copilot設定
later(function()
  add({ source = 'https://github.com/zbirenbaum/copilot.lua' })

  require('copilot').setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<Tab>",
        accept_word = "<S-Tab>",
        accept_line = "<C-j>",
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<Esc>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      gitcommit = true,
      help = true,
      lua = true,
      ['*'] = function()
        -- disable for files with specific names
        local fname = vim.fs.basename(vim.api.nvim_buf_get_name(0))
        local disable_patterns = { 'env', 'conf', 'local', 'private' }
        return vim.iter(disable_patterns):all(function(pattern)
          return not string.match(fname, pattern)
        end)
      end,
    },
  })

  local hl = vim.api.nvim_get_hl(0, { name = 'Comment' })
  vim.api.nvim_set_hl(0, 'CopilotSuggestion', vim.tbl_extend('force', hl, { underline = true }))
end)

-- nvim-treesitter
later(function()
  add({
    source = 'https://github.com/nvim-treesitter/nvim-treesitter',
    hooks = {
      post_checkout = function()
        vim.cmd.TSUpdate()
      end
    },
  })
  -- avoid error
vim.treesitter.start = (function(wrapped)
  return function(bufnr, lang)
    lang = lang or vim.fn.getbufvar(bufnr or '', '&filetype')
    pcall(wrapped, bufnr, lang)
  end
end)(vim.treesitter.start)

  ---@diagnostic disable-next-line: missing-fields
  require('nvim-treesitter.configs').setup({
    -- auto-install parsers
    ensure_installed = { 'lua', 'vim', 'tsx' },
    highlight = { enable = true },
  })
end)

