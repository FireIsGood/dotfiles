return {
  -- Meme plugins
  {
    dir = "~/Documents/Programming/nvim-fish-plugin",
    lazy = false,
    config = function()
      require("nvim-fish-plugin").setup({
        name = "Friendly Angler",
        power = 400,
        customFish = { "Bass", "Jellyfish" },
      })
    end,
  },
  -- Real plugins
  {
    -- dir = "~/Documents/Programming/nvim-clear-registers",
    "FireIsGood/nvim-clear-registers",
    lazy = false,
    config = true,
  },
}
