return {
  "nvim-lualine/lualine.nvim",
  config = function()
    vim.opt.showmode = false
    require("lualine").setup({
      options = {
        disabled_filetypes = { "alpha" },
        theme = "auto",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_y = { "location" },
      },
    })
  end,
}
