return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      handle = {
        blend = 0,
        highlight = "PmenuSBar",
      },
    })
  end,
}
-- return {
--   "lewis6991/satellite.nvim",
--   commit = "5d33376", -- TODO following versions require nvim 0.10
--   event = "VeryLazy",
--   opts = {
--     winblend = 10, -- little transparency, hard to see in many themes otherwise
--     handlers = {
--       marks = { enable = false }, -- FIX mark-related error message
--       quickfix = { enable = true, signs = { "·", ":", "󰇙" } },
--     },
--   },
-- }
