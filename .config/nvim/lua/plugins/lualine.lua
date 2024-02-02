return {
  "nvim-lualine/lualine.nvim",
  config = function()
    vim.opt.showmode = false
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = "|",
        section_separators = "",
      },
    })
  end,
}
