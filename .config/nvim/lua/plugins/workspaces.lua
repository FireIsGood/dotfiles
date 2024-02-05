return {
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    config = function()
      require("workspaces").setup({
        hooks = {
          open_pre = function()
            vim.cmd("SessionsStop") -- Stops recording the session
            vim.cmd("silent %bdelete!") -- Closes all tabs
          end,
          open = function()
            vim.cmd("SessionsLoad") -- Load a saved session
          end,
        },
      })
    end,
  },
  {
    "natecraddock/sessions.nvim",
    config = function()
      require("sessions").setup({
        session_filepath = vim.fn.stdpath("data") .. "/sessions", -- Saved at ~/.local/share/nvim/sessions/
        absolute = true,
      })
    end,
  },
}
