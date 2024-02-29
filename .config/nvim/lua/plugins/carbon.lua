return {
  "ellisonleao/carbon-now.nvim",
  lazy = true,
  cmd = "CarbonNow",
  opts = {
    base_url = "https://carbon.now.sh/",
    open_cmd = "xdg-open",
    options = {
      bg = "#9FB6D8",
      drop_shadow_blur = "40px",
      drop_shadow = true,
      drop_shadow_offset_y = "20px",
      font_family = "Fira Code",
      font_size = "18px",
      line_height = "133%",
      line_numbers = true,
      theme = "one-dark",
      titlebar = "",
      watermark = false,
      width = "680",
      window_theme = "round",
    },
  },
}
