return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup()
    require("mini.bufremove").setup()
    require("mini.files").setup()
  end,
}
