local M = {}

-- エラーハンドリング付きのrequire関数
local function safe_require(module)
  local success, err = pcall(require, module)
  if not success then
    print("Error loading " .. module .. ": " .. tostring(err))
    return false
  end
  return true
end

-- リロード関数
function M.reload_config()
  -- 既存のautocmdをクリア
  pcall(function()
    vim.api.nvim_clear_autocmds({ group = "DiagnosticFloat" })
  end)

  -- モジュールキャッシュをクリア
  local cleared_modules = {}
  for name, _ in pairs(package.loaded) do
    if name:match("^config") or name:match("^keymaps") or name:match("^utils") then
      package.loaded[name] = nil
      table.insert(cleared_modules, name)
    end
  end

  -- 再読み込み
  local config_ok = safe_require("config")
  local keymaps_ok = safe_require("keymaps")

  if config_ok and keymaps_ok then
    print("Configuration reloaded! (cleared: " .. table.concat(cleared_modules, ", ") .. ")")
  else
    print("Configuration reload completed with errors")
  end
end

-- 初期設定の読み込み
function M.load_initial_config()
  print("Loading initial configuration...")

  local modules = { "lazy_setup", "keymaps", "config" }
  local all_ok = true

  for _, module in ipairs(modules) do
    if not safe_require(module) then
      all_ok = false
    end
  end

  if all_ok then
    print("All modules loaded successfully!")
  else
    print("Some modules failed to load")
  end
end

-- コマンドとキーマップの設定
function M.setup_reload_commands()
  -- リロードコマンド
  vim.api.nvim_create_user_command("ReloadConfig", M.reload_config, {})

  -- 便利なキーマップ
  vim.keymap.set("n", "<leader>rr", M.reload_config, { desc = "Reload configuration" })

  -- 自動リロード
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*/nvim/init.lua", "*/nvim/lua/**/*.lua" },
    callback = M.reload_config,
  })
end

return M
