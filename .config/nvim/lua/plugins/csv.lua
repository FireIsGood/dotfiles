return {
  {
    "hat0uma/csvview.nvim",
    config = function()
      require("csvview").setup()
    end,
  },
  {
    {
      "mechatroner/rainbow_csv",
      ft = {
        "csv",
        "tsv",
        "csv_semicolon",
        "csv_whitespace",
        "csv_pipe",
        "rfc_csv",
        "rfc_semicolon",
      },
      cmd = {
        "RainbowDelim",
        "RainbowDelimSimple",
        "RainbowDelimQuoted",
        "RainbowMultiDelim",
      },
    },
  },
}
