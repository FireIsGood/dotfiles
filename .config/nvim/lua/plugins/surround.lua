if true then
  return {}
end
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert = "<C-g>z",
        -- insert_line = "gC-ggZ",
        normal = "gz",
        normal_cur = "gZ",
        normal_line = "gzg",
        normal_cur_line = "gZg",
        visual = "gz",
        visual_line = "gz",
        delete = "gzd",
        change = "gzr",
      },
    })
  end,
}
