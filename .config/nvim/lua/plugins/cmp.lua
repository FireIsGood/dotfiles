return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji", "nat-418/cmp-color-names.nvim" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local sources = { { name = "emoji" }, { name = "color_names" } }
    opts.sources = vim.tbl_deep_extend("force", opts.sources, sources)
  end,
}
