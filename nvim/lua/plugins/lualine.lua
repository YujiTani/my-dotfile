return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		return {
			options = {
				theme = "tokyonight",
				globalstatus = true,
				icons_enabled = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "|" },
				disabled_filetypes = {
					statusline = { "dashboard", "alpha" },
					winbar = { "dashboard", "alpha" },
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
						fmt = function(str)
							return str:sub(1, 1) -- モード表示を短く
						end
					}
				},
				lualine_b = {
					{ "branch", icon = "󰘬" },
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " "
						},
						colored = true,
					}
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " "
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						path = 1, -- 0: ファイル名のみ, 1: 相対パス, 2: フルパス
						symbols = {
							modified = "●", -- 変更されたファイルのマーク
							readonly = "󰌾", -- 読み取り専用マーク
							unnamed = "[No Name]", -- 名前のないバッファの表示
						}
					},
				},
				lualine_x = {
					{
						function() return require("noice").api.status.command.get() end,
						cond = function()
							return package.loaded["noice"] and
							    require("noice").api.status.command.has()
						end,
					},
					{
						function() return require("noice").api.status.mode.get() end,
						cond = function()
							return package.loaded["noice"] and
							    require("noice").api.status.mode.has()
						end,
					},
					{
						function() return "  " .. require("dap").status() end,
						cond = function()
							return package.loaded["dap"] and
							    require("dap").status() ~= ""
						end,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = {
					{ "progress", separator = " ",                  padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "neo-tree", "lazy" },
		}
	end,
}
