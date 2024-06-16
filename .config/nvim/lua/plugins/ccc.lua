return {
  "uga-rosa/ccc.nvim",
  commit = "ec6e23fd2c0bf4ffcf71c1271acdcee6e2c6f49c",
  config = function()
    local ccc = require("ccc")
    ccc.setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
        filetypes = {
          "css",
          "scss",
          "astro",
          "svelte",
        },
      },
    })
  end,
}
