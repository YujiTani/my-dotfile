return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    padding = true,  -- コメント文字と文字列の間にスペースを追加
    sticky = true,   -- カーソル位置を維持
    ignore = nil,    -- コメントを無視するラインパターン
    toggler = {
      line = 'gcc',  -- ノーマルモードでライン全体をトグル
      block = 'gbc', -- ノーマルモードでブロックコメントをトグル
    },
    opleader = {
      line = 'gc',   -- ビジュアルモードでラインコメントの操作
      block = 'gb',  -- ビジュアルモードでブロックコメントの操作
    },
    extra = {
       above = 'gcO', -- 現在の行の上に新しいコメント行を追加
       below = 'gco', -- 現在の行の下に新しいコメント行を追加
       eol = 'gcA',   -- 行末にコメントを追加
    },
  },
}
