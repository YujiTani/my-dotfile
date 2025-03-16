-- lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  opts = {
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
	-- ファイルシステムの変更を監視してOilをリロードするにはtrueに設定
  	watch_for_changes = false,
	delete_to_trash = true,
  },
  lazy = false,
}
