return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        support_filetypes = {
          "*.ts",
          "*.tsx",
          "*.js",
          "*.jsx",
          "*.json",
          "*.lua",
          "*.py",
          "*.*",
        },
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {
          { fg = "#806d9c" },
        },
      },
      indent = {
        enable = true,
        use_treesitter = true,
        chars = { "│" },
        style = {
          { fg = "#404040" },
        },
      },
      line_num = {
        enable = true,
        support_filetypes = {
          "*.*",
        },
        style = {
          fg = "#2d79c7",
          bold = true,
        },
      },
      blank = {
        enable = true,
        chars = {
          "․",
        },
        style = {
          { fg = "#363636" },
        },
      },
    })
  end,
}
