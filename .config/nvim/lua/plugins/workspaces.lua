return {
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    config = function()
      require("workspaces").setup({
        hooks = {
          open_pre = function()
            vim.cmd("SessionsStop") -- Stops recording the session
            if #vim.api.nvim_list_wins() > 1 then
              vim.cmd("winc h") -- Go to a real buffer (get outta the file explorer!)
            end
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
