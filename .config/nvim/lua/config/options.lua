--         --
-- OPTIONS --
--         --
local opt = vim.opt

-- Mouse for nerds
-- opt.mouse = ""

-- Scroll offset
opt.scrolloff = 15
opt.sidescrolloff = 2

-- Stop hiding stuff in Markdown
opt.conceallevel = 0
opt.concealcursor = "n"

-- Default tab sizes
opt.tabstop = 2
opt.shiftwidth = 0 -- use tabstop
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true

-- Show trailing whitespace but fancy
opt.list = true
opt.listchars = {
  tab = "→ ",
  trail = "╳",
  nbsp = "⎵",
}

-- Wrap lines better
opt.linebreak = true

-- Use a register for the clipboard
opt.clipboard = ""

-- Use spelling
opt.spell = true

-- Funny title
opt.title = true -- Use custom title
opt.titlelen = 0 -- No limit on length
opt.titlestring = "why am i in comic sans"
