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
  {
    -- dir = "~/Documents/Programming/spaceman.nvim",
    "FireIsGood/spaceman.nvim",
    opts = {
      workspaces = {
        { "Nvim-Data", "~/.local/share/nvim" },
        { "Config", "~/dotfiles/.config/nvim" },
        { "Dotfiles", "~/dotfiles" },
      },
      directories = {
        "~/Documents/Programming", -- My actual folders
        -- "~/Desktop/Somewhere", -- Showcase folders
      },
      use_default_keymaps = true,
      rename_function = function(name)
        return string.gsub(" " .. name, "%W%l", string.upper):sub(2)
      end,
      hooks = {
        before_move = { "noh", "SessionsStop", "silent %bdelete!" },
        after_move = { "SessionsLoad" },
      },
    },
  },
}
