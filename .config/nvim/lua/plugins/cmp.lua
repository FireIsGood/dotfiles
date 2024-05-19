return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji", "nat-418/cmp-color-names.nvim" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, { { name = "emoji" }, { name = "color_names" } })
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-y>"] = require("cmp").mapping.complete(),
    })
  end,
}
