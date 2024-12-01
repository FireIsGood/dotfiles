return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    render_modes = { "n", "c", "i" },
    heading = {
      position = "inline",
      icons = { " 󰎥 ", " 󰎨 ", " 󰎫 ", " 󰎲 ", " 󰎯 ", " 󰎴 " },
      width = "block",
      right_pad = 1,
    },
    code = {
      language_name = false,
      above = "█",
      below = "█",
    },
    dash = {
      width = 120,
    },
  },
}
