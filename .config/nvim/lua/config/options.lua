--         --
-- OPTIONS --
--         --
local opt = vim.opt

-- Stop hiding stuff in markdown
opt.conceallevel = 0

-- Default tab sizes
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true

-- Show trailing whitespace but fancy
opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "╳",
  nbsp = "+",
}

-- Use a register for the clipboard
opt.clipboard = ""

-- Funny title
vim.opt.title = true -- Use custom title
vim.opt.titlelen = 0 -- No limit on length
vim.opt.titlestring = "why am i in comic sans"
