return {
  {
    dir = "~/Documents/Programming/spaceman.nvim",
    -- "FireIsGood/spaceman.nvim",
    opts = {
      workspaces = {
        { "nvim-data", "~/.local/share/nvim" },
        { "config", "~/dotfiles/.config/nvim" },
        "~/dotfiles",
        "~/Desktop",
        "/media/fireisgood/Users/FireIsGood/Desktop/College/Y2T3/CS 374",
        "/media/fireisgood/Users/FireIsGood/Desktop/College/Y2T3/CS 290",
      },
      directories = {
        "~/Documents/Programming", -- My actual folders
        "~/Desktop/Somewhere", -- Showcase folders
      },
      use_default_keymaps = true,
      rename_function = function(name)
        return string.gsub(" " .. name, "%W%l", string.upper):sub(2) -- Name to title case
      end,
      telescope_opts = {
        scroll_strategy = "limit",
      },
      hooks = {
        before_move = "Neotree close",
      },
    },
  },
}
