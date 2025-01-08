return {
  "saghen/blink.cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "nat-418/cmp-color-names.nvim",
    "saghen/blink.compat",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = { sources = { compat = { "emoji", "color_names" } } },
}
