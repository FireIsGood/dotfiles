return {
  -- Meme plugins
  {
    dir = "~/Documents/Programming/pond.nvim",
    config = function()
      require("pond-nvim").setup()
    end,
  },
  -- Real plugins
  {
    -- dir = "~/Documents/Programming/nvim-clear-registers",
    "FireIsGood/nvim-clear-registers",
    lazy = false,
    config = true,
  },
  {
    dir = "~/Documents/Programming/better-comments.nvim",
    -- "FireIsGood/better-comments.nvim",
    lazy = false,
    config = true,
  },
}
