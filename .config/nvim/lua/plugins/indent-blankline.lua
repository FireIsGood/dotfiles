return {
  "lukas-reineke/indent-blankline.nvim",
  commit = "3d08501caef2329aba5121b753e903904088f7e6",
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
