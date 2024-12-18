return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "isak102/telescope-git-file-history.nvim", dependencies = { "tpope/vim-fugitive" } },
  },
  lazy = false,
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        follow = true,
      },
    },
  },
  keys = {
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>ff", false },
    { "<leader>f/", false },
  },
  init = function()
    require("telescope").load_extension("git_file_history")
  end,
}
