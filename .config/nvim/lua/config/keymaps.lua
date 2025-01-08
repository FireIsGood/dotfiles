--          --
-- KEYBINDS --
--          --
local map = vim.keymap.set
local wk = require("which-key")
local cmd = vim.api.nvim_create_user_command

--
--[[ Default rewrites ]]
--

require("config.keymaps-default")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- modified to center after moving
map("n", "n", "'Nn'[v:searchforward].'zv'.'zz'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'.'zz'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })

--
--[[ General Keybinds ]]
--

-- Snap to center when moving by half pages
map({ "n", "x" }, "<C-d>", "<C-d>zz", { desc = "Down half page", noremap = true })
map({ "n", "x" }, "<C-u>", "<C-u>zz", { desc = "Up half page", noremap = true })

-- Replace the join command
map({ "n", "x" }, "M", "J", { desc = "Merge" })

-- Funny esc meme
map("n", "<esc>", "<CMD>noh<CR><ESC>", {})
map("n", "<C-c>", "<CMD>noh<CR><ESC>", {})

-- Remove annoying highlights on exiting insert mode
map("i", "<esc>", "<CMD>noh<CR><ESC>", { desc = "Escape and clear hlsearch" })
map("i", "<C-c>", "<CMD>noh<CR><ESC>", { desc = "Escape and clear hlsearch" })

-- More powerful J and K (use 6j/6k)
-- Via Pseudometa (https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl)
map({ "n", "x" }, "<S-j>", "6gj")
map({ "n", "x" }, "<S-k>", "6gk")

-- Saner z.
map("n", "z.", "zz", { desc = "Center this line", silent = true })

-- Yank and Paste with System clipboard via leader
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system clipboard", silent = true })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste after from system clipboard", silent = true })
map({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard", silent = true })

-- Open the current working directory
map({ "n" }, "<leader>o", "<cmd>silent !xdg-open $PWD<CR>", { desc = "Open PWD in a file explorer" })

local vim_save = function()
  vim.cmd("wa")
end

cmd("W", vim_save, { desc = "Save all (shortcut)" })
cmd("Wa", vim_save, { desc = "Save all (shortcut)" })
cmd("WA", vim_save, { desc = "Save all (shortcut)" })

-- CD to currently open file
cmd("Here", function()
  vim.cmd(":cd %:p:h")
  print('PWD is now in "' .. vim.fn.expand("%:p:h") .. '"')
end, { desc = "CD to current file" })

-- diagnostic
---@param next "f"|"b"
---@param severity "ERROR"|"WARN"?
local diagnostic_goto = function(next, severity)
  local go = (next == "f") and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  local severity_index = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity_index })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto("f"), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto("b"), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto("f", "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto("b", "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto("f", "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto("b", "WARN"), { desc = "Prev Warning" })

-- Terminal
map("t", "<c-u>", "<cmd>resize +999<cr>", { desc = "Max terminal size" })

--[[ Buffers ]]

-- Moving
map("n", "<leader><", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left", silent = true })
map("n", "<leader>>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right", silent = true })

--[[ Plugins ]]

-- Aerial
map({ "n" }, "<leader>co", "<cmd>AerialToggle<CR>", { desc = "Open symbol outline" })

-- Oil (file management via buffer) BUT IT'S BROKEN RIGHT NOW
map("n", "-", function()
  require("oil").open_float(nil)
end, { desc = "Open parent directory", silent = true })

-- Carbon Now (pretty code screenshots)
map("v", "<leader>cn", ":CarbonNow<CR>", { desc = "Screenshot", silent = true })

-- Comment with / in insert mode
map("i", "<C-_>", require("Comment.api").toggle.linewise.current, { desc = "Toggle line as comment" })

-- Code action hover
map("n", "gh", vim.lsp.buf.hover, { desc = "Hover" })

-- Git
map({ "n" }, "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview this hunk" })

-- Harpoon (commands set in plugin file)
wk.add({ "<leader>h", group = "+Harpoon" })
map("n", "<leader>hh", "<cmd>HarpoonMenu<CR>", { desc = "Open the Harpoon menu" })
map("n", "<leader>ha", "<cmd>HarpoonAddFile<CR>", { desc = "Add the current file to Harpoon" })
map("n", "<M-j>", "<cmd>HarpoonBuffer 1<CR>", { desc = "Go to buffer 1" })
map("n", "<M-k>", "<cmd>HarpoonBuffer 2<CR>", { desc = "Go to buffer 2" })
map("n", "<M-l>", "<cmd>HarpoonBuffer 3<CR>", { desc = "Go to buffer 3" })
map("n", "<M-;>", "<cmd>HarpoonBuffer 4<CR>", { desc = "Go to buffer 4" })

-- Scissors
wk.add({ "<leader>i", group = "+Snippets" })
map("n", "<leader>ie", require("scissors").editSnippet, { desc = "Edit snippets" })
map({ "n", "x" }, "<leader>ia", require("scissors").addNewSnippet, { desc = "Add a snippet" })

-- Snacks terminal
map("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<c-_>", function()
  Snacks.terminal()
end, { desc = "which_key_ignore" })

-- Undo tree
map("n", "<leader>fu", require("undotree").toggle, { desc = "Undo tree", silent = true })

-- Various Text Objects (basically just Entire Buffer)
-- Select all text
local vto = require("various-textobjs")
-- stylua: ignore start
map({ "o", "x" }, "ae", function() vto.entireBuffer() end, { desc = "the entire buffer", silent = true })
map({ "o", "x" }, "iq", function() vto.anyQuote("inner") end, { desc = "a quote", silent = true })
map({ "o", "x" }, "aq", function() vto.anyQuote("outer") end, { desc = "a quote", silent = true })
-- stylua: ignore end

--
--[[ Workspaces and Sessions ]]
--

wk.add({ "<leader>w", group = "+workspaces/sessions" })
-- I'm using the spaceman.nvim (my plugin) defaults
map("n", "<leader>wi", function()
  require("spaceman").api_save_session()
  vim.notify("Saved session!")
end, { desc = "Save session manually" })

--
--[[ Plugin dev stuff ]]
--
map("x", "<leader>ce", ":.lua<CR>", { desc = "Run selected code" })
map("n", "<leader>cx", "<CMD>%lua<CR>", { desc = "Run entir file" })
