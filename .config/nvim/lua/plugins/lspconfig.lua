return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    inlay_hints = { enabled = false },
    document_highlight = { enabled = false },
    servers = {
      typos_lsp = {
        config = vim.fn.stdpath("data") .. "/typos.toml",
        init_options = { diagnosticSeverity = "information" },
      },
      taplo = {
        keys = {
          { "K", false },
        },
      },
      biome = {},
      -- css_variables = {},
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
    -- disable a keymap
    keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "gh", vim.lsp.buf.hover, mode = "n" }
    -- require("lspconfig").biome.setup({})
    -- require("lspconfig").css_variables.setup({})
  end,
}
