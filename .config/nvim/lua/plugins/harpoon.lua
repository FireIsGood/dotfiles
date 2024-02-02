local gotoBuffer = function(opts)
  local number = tonumber(opts.args)
  if number == nil then
    print("Error in configuration of buffer jump. Please specify a number.")
    return
  end

  require("harpoon.ui").nav_file(number)
end

return {
  "ThePrimeagen/harpoon",
  config = function()
    local cmd = vim.api.nvim_create_user_command

    -- Set up commands

    -- Open the main UI
    cmd("HarpoonMenu", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "Open quick menu" })

    -- Add the current file
    cmd("HarpoonAddFile", function()
      require("harpoon.mark").add_file()
    end, { desc = "Add a file to Harpoon" })

    -- Alias to go to a buffer from string
    -- Call via "HarpoonBuffer 1" and etc.
    cmd("HarpoonBuffer", function(opts)
      gotoBuffer(opts)
    end, { nargs = "?" })
  end,
}
