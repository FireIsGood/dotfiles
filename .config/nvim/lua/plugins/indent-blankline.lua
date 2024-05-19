return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    scope = { highlight = "Ibl-custom-hl" },
    indent = {
      char = "┆",
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, "Ibl-custom-hl", { fg = "#6e738d" })
  end,
}
