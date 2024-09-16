return {
  {
    -- dir = "~/Documents/Programming/spaceman.nvim",
    "FireIsGood/spaceman.nvim",
    opts = {
      workspaces = {
        "~",
        { "nvim-data", "~/.local/share/nvim" },
        { "config", "~/dotfiles/.config/nvim" },
        "~/dotfiles",
        "~/Desktop",
        "~/Documents/College/Y2T3/CS 374",
        "~/Documents/College/Y2T3/CS 290",
        "/home/fireisgood/Documents/obsidian-monolith",
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
