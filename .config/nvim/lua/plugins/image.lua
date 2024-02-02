if true then
  return {}
end
return {
  "3rd/image.nvim",
  config = function()
    require("image").setup()
  end,
}
