return {
  -- dir = "~/Documents/Programming/spaceman.nvim",
  "FireIsGood/spaceman.nvim",
  config = function()
    require("spaceman").setup({
      workspaces = {
        "~",
        { "nvim-data", "~/.local/share/nvim" },
        { "config", "~/dotfiles/.config/nvim" },
        "~/dotfiles",
        "~/Desktop",
        "~/Documents/College/Y2T3/CS 374",
        "~/Documents/College/Y2T3/CS 290",
        "~/Documents/College/Y3T1/CS 340",
        "~/Documents/College/Y3T1/CS 381",
        "~/Documents/College/Y3T1/CS 450",
        "~/Documents/College/Y3T1/CS 474",
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
        scroll_strategy = "limit", -- Do not loop back when scrolling past end
      },
      hooks = {
        before_move = "Neotree close",
      },
    })
  end,
}
