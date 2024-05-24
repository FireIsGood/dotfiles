return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    document_highlight = { enabled = false },
    servers = {
      typos_lsp = {
        config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
        init_options = { diagnosticSeverity = "information" },
      },
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
  end,
}
