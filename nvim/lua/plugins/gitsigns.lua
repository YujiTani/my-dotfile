return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "▋" },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "▋" },
      untracked = { text = "┆" },
    },
    -- エラーや警告のハイライトを追加
    trouble = true,
    -- 視認性を高めるため太めのバーを使用
    signs_priority = 10,
    -- Neovim 0.10+ の新機能：マルチラインの変更にも対応
    show_blamed_line = true,
    -- 文字列の先頭と末尾の変更を明確に表示
    word_diff = false,
    -- 色の設定（アイコンが見やすくなるように調整）
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      -- VimのハイライトグループにGitsignsのカラーを設定
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#98be65" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ECBE7B" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff6c6b" })

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- その他の設定はそのまま保持
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
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "行のblame表示")
      map("n", "<leader>hd", gs.diffthis, "差分表示")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "チルダと差分表示")
      map("n", "<leader>tb", gs.toggle_current_line_blame, "行blame表示の切替")
      map("n", "<leader>td", gs.toggle_deleted, "削除表示の切替")
    end,
    -- その他の設定はそのまま保持
    signs_staged_enable = true,
    signcolumn = true,
    numhl = false,
    linehl = false,
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
}
