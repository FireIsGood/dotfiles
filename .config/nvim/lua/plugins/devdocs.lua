return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
    telescope = {}, -- passed to the telescope picker
    filetypes = {
      -- extends the filetype to docs mappings used by the `DevdocsOpenCurrent` command, the version doesn't have to be specified
      -- scss = "sass",
      -- javascript = { "node", "javascript" }
    },
    float_win = { -- passed to nvim_open_win(), see :h api-floatwin
      relative = "editor",
      height = 35,
      width = 150,
      border = "rounded",
    },
    wrap = false, -- text wrap, only applies to floating window
    previewer_cmd = nil, -- for example: "glow"
    cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "80" }
    cmd_ignore = {}, -- ignore cmd rendering for the listed docs
    picker_cmd = false, -- use cmd previewer in picker preview
    picker_cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "50" }
    ensure_installed = { "html", "css" }, -- get automatically installed
    after_open = function(bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", {})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-c>", ":close<CR>", {})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", {})
    end, -- callback that runs after the Devdocs window is opened. Devdocs buffer ID will be passed in
  },
}
