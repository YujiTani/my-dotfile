-- クリップボード連携のキーマップ

-- 行をクリップボードにコピー
vim.keymap.set("n", "<leader>y", '"+yy', { desc = "Copy line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to clipboard" })

-- 行をクリップボードにコピーし、選択範囲を切り取る
vim.keymap.set("n", "<leader>d", '"+dd', { desc = "Cut line to clipboard" })
vim.keymap.set("v", "<leader>d", '"+d', { desc = "Cut selection to clipboard" })

-- oilのキーマップ
vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open Oil file explorer" })

-- Telescopeのキーマップ
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "ファイル検索" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "テキスト検索" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help Tags" })

-- copilotのキーマップ
vim.keymap.set("n", "<leader>ct", "<CMD>Copilot toggle<CR>", { desc = "toggle Copilot" })

-- lazygitのキーマップ
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- カーソル位置の診断情報を浮動ウィンドウで表示
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "診断情報を表示" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "次の診断へ" }) -- 次の診断位置へ移動
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "前の診断へ" }) -- 前の診断位置へ移動
