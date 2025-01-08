local SECRET_CONFIG = require("SECRET_workspaces")
return {
  -- dir = "~/Documents/Programming/spaceman.nvim",
  "FireIsGood/spaceman.nvim",
  config = function()
    require("spaceman").setup({
      workspaces = SECRET_CONFIG.workspaces,
      directories = SECRET_CONFIG.directories,
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
