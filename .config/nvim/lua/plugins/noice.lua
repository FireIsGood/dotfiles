-- Customize noice to be less annoying
return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = false,
      inc_rename = false,
    },
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { conceal = false, pattern = "^:", icon = "", lang = "vim" },
        search_down = { conceal = false, kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { conceal = false, kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { conceal = false, pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = {
          conceal = false,
          pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
          icon = "",
          lang = "lua",
        },
        help = { conceal = false, pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = { conceal = false }, -- Used by input()
      },
    },
  },
}
