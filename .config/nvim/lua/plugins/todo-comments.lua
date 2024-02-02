return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- SUS: amonger
    -- IMPOSTER: amonger
    -- some test

    -- Default things:
    -- PERF: fast inverse square root
    -- HACK: evil bitwise
    -- TODO: fix the evil bitwise
    -- TEST: should work??
    -- NOTE: why is it like this
    -- FIX:  this

    keywords = {
      -- Colors can be [error, warning, info, hint, default, test]
      SUS = {
        color = "warning",
        alt = { "SUSPICIOUS", "IMPOSTER" },
      },
    },
    highlight = {
      multiline = false,
      keyword = "fg",
      -- pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
    },
    search = {
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  },
}
