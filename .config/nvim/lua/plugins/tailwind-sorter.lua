if true then
  return {}
end
return {
  "laytan/tailwind-sorter.nvim",
  lazy = true,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
  build = "cd formatter && npm i && npm run build",
  config = true,
}
