return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  opts = {
    window = {
      width = 35,
      mappings = {
        ["l"] = "open",
        -- ["L"] = "expand_all_nodes",
        ["h"] = "close_node",
        ["H"] = "close_all_nodes",
        ["s"] = "toggle_hidden",
        ["/"] = "noop",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_by_name = {
          "node_modules",
        },
        hide_by_pattern = {
          ".git/*/*",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".git",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ action = "show", position = "right", toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
  },
}
