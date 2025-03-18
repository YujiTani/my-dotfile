-- lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  opts = {
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
  	watch_for_changes = true,
        delete_to_trash = true,
  },
  lazy = false,
}
