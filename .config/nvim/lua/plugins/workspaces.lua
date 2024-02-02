---@diagnostic disable-next-line: unused-function
local function open_tree()
  vim.cmd("Neotree") -- Open neotree
  vim.cmd("winc p") -- Move to the first tab on the right

  -- Close the random annoying empty file
  if vim.api.nvim_buf_get_name(0) == "" then
    -- print("Nerd annhihilated")
    require("mini.bufremove").delete()
  else
    -- print("No need, no nerd detected.")
  end
end

return {
  "natecraddock/workspaces.nvim",
  lazy = false,
  config = function()
    require("workspaces").setup({
      hooks = {
        open_pre = function()
          vim.cmd("SessionsStop")
          vim.cmd("silent %bdelete!")
        end,
        open = function()
          vim.cmd("SessionsLoad") -- Load a saved session
          -- open_tree()
        end,
      },
    })
  end,
}
