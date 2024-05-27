return {
  -- {
  --   "natecraddock/workspaces.nvim",
  --   lazy = false,
  --   opts = {
  --     hooks = {
  --       open_pre = function()
  --         vim.cmd("SessionsStop") -- Stops recording the session
  --         vim.cmd("Neotree close") -- Close Neo tree
  --         vim.cmd("silent %bdelete!") -- Closes all tabs
  --       end,
  --       open = function()
  --         vim.cmd("SessionsLoad") -- Load a saved session
  --       end,
  --     },
  --   },
  -- },
  {
    "natecraddock/sessions.nvim",
    opts = {
      session_filepath = vim.fn.stdpath("data") .. "/sessions", -- Saved at ~/.local/share/nvim/sessions/
      absolute = true,
    },
  },
}
