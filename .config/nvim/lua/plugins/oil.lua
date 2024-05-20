return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = false,
    delete_to_trash = true,
    constrain_cursor = "name",
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
    },
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
    },
    float = {
      max_width = 120,
      max_height = 40,
    },
  },
}
