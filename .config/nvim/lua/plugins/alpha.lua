--- @param len number
local function pad(len)
  return { type = "padding", val = len }
end

--- @param text string
local function comment(text)
  return {
    type = "text",
    val = text,
    opts = {
      hl = "SpecialComment",
      shrink_margin = false,
      position = "center",
    },
  }
end

--- @param values table
local function button_list(values)
  local list = {
    type = "group",
    val = values,
    opts = { hl = "AlphaButtons" },
  }
  for _, b in ipairs(list.val) do
    b.opts.hl = "AlphaButtons"
    b.opts.hl_shortcut = "AlphaShortcut"
  end
  return list
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  init = false,
  config = function()
    local button = require("alpha.themes.dashboard").button

    -- Random logo stuff
    math.randomseed(os.time())
    local logo_list = require("meme.logos")
    local random_index = math.random(#logo_list)
    local logo = vim.split(logo_list[random_index], "\n")

    local header = {
      type = "text",
      val = logo,
      opts = { position = "center", hl = "AlphaHeader" },
    }

    local all_workspaces = require("spaceman.workspace").get_workspaces()
    local workspace_list = {}

    for i, w in ipairs(all_workspaces) do
      if #workspace_list == 10 then
        break
      end

      local shortcut = tostring(math.fmod(i, 10)) -- wrap to 0
      local workspace_button = button(shortcut, "  " .. w.name)
      local _workspace = function()
        require("spaceman").api_open_workspace(w.path)
      end
      workspace_button.on_press = _workspace
      workspace_button.opts.keymap = { "n", shortcut, _workspace, { noremap = true, silent = true, nowait = true } }

      workspace_list[i] = workspace_button
    end

    local workspaces = button_list(workspace_list)

    local buttons = button_list({
        -- stylua: ignore start
        button("w", "󱎃  Telescope workspaces",   "<cmd>Spaceman<cr>"),
        button("q", "  Quit",                   "<cmd>qa<cr>"),
      -- stylua: ignore end
    })

    require("alpha").setup({
      layout = {
        pad(4),
        header,
        pad(2),
        comment("Quick Actions"),
        pad(1),
        buttons,
        pad(2),
        comment("Workspaces"),
        pad(1),
        workspaces,
      },
      opts = {
        margin = 5,
      },
    })

    -- Fix scrolloff (set to top pad size)
    vim.opt_local.scrolloff = 4
  end,
}
