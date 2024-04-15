--         --
-- OPTIONS --
--         --
local opt = vim.opt

-- Scroll offset
opt.scrolloff = 15

-- Stop hiding stuff in markdown
opt.conceallevel = 0
opt.concealcursor = "n"

-- Default tab sizes
opt.tabstop = 4
opt.shiftwidth = 0 -- use tabstop
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true

-- Show trailing whitespace but fancy
opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "╳",
  nbsp = "⎵",
}

-- Use a register for the clipboard
opt.clipboard = ""

-- Funny title
vim.opt.title = true -- Use custom title
vim.opt.titlelen = 0 -- No limit on length
vim.opt.titlestring = "why am i in comic sans"
