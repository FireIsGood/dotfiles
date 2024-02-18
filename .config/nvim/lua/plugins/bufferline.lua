return {
  "akinsho/bufferline.nvim",
  lazy = false,
  opts = function()
    local bufferline = require("bufferline")
    return {
      options = {
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        separator_style = "slope",
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    }
  end,
}
