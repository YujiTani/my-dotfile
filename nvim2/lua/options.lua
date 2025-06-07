-- ===== 表示・外観設定 =====
vim.opt.number = true                                    -- 行番号表示
vim.opt.cursorline = true                               -- カーソル行ハイライト
vim.opt.cursorcolumn = true                             -- カーソル列ハイライト
vim.opt.showmatch = true                                -- 対応括弧をハイライト
vim.opt.termguicolors = true                            -- 24bit色対応
vim.opt.showbreak = "↪ "                                -- 折り返し行の表示
vim.opt.listchars = { tab = "→ ", space = "·", trail = "×" } -- 不可視文字の表示

-- ===== 行の折り返し・テキスト表示 =====
vim.opt.wrap = true                                     -- 改行する
vim.opt.linebreak = true                                -- 単語境界で改行
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'                -- カーソル移動時の行端処理

-- ===== 検索設定 =====
vim.opt.hlsearch = true                                 -- 検索結果ハイライト

-- ===== インデント・タブ設定 =====
vim.opt.expandtab = true                                -- タブをスペースに展開
vim.opt.tabstop = 2                                     -- タブ幅
vim.opt.shiftwidth = 2                                  -- インデント幅
vim.opt.autoindent = true                               -- 自動インデント

-- ===== スクロール設定 =====
vim.opt.scrolloff = 8                                   -- カーソル周りの余白（縦）
vim.opt.sidescrolloff = 8                               -- カーソル周りの余白（横）

-- ===== ファイル操作設定 =====
vim.opt.autowrite = true                                -- 自動保存
vim.opt.autoread = true                                 -- ファイル変更時自動読み込み

-- ===== コマンドライン・補完設定 =====
vim.opt.wildmenu = true                                 -- コマンドライン補完メニュー

-- ===== パフォーマンス設定 =====
vim.opt.ttyfast = true                                  -- 高速ターミナル

-- ===== クリップボード設定 =====
vim.opt.clipboard:append('unnamedplus,unnamed')        -- システムクリップボード連携
