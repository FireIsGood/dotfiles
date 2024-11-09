--          --
-- KEYBINDS --
--          --
local Util = require("lazyvim.util")

local map = vim.keymap.set
local wk = require("which-key")
local cmd = vim.api.nvim_create_user_command

--
--[[ Default rewrites ]]
--

require("config.keymaps-default")

-- Tmux navigator stuff
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Go to right window", remap = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- modified to center after moving
map("n", "n", "'Nn'[v:searchforward].'zv'.'zz'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'.'zz'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- lazygit
map("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { cwd = vim.loop.cwd(), esc_esc = false, ctrl_hjkl = false, border = "rounded" })
end, { desc = "Lazygit" })

-- floating terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = vim.loop.cwd(), border = "rounded", size = { width = 0.8, height = 0.8 } })
end
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
-- SINGLE ESC EXIT
-- map("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

--
--[[ General Keybinds ]]
--

-- Snap to center when moving by half pages
map({ "n", "x" }, "<C-d>", "<C-d>zz", { desc = "Down half page", noremap = true })
map({ "n", "x" }, "<C-u>", "<C-u>zz", { desc = "Up half page", noremap = true })

-- Replace the join command
map({ "n", "x" }, "M", "J", { desc = "Merge" })

-- Funny esc meme
local EscapeInNorm = function()
  vim.cmd("noh")
  vim.api.nvim_feedkeys("", "n", true)
end
map("n", "<esc>", EscapeInNorm, {})
map("n", "<C-c>", EscapeInNorm, {})

-- Remove annoying highlights on exiting insert mode
map("i", "<esc>", EscapeInNorm, { desc = "Escape and clear hlsearch" })
map("i", "<C-c>", EscapeInNorm, { desc = "Escape and clear hlsearch" })

-- More powerful J and K (use 6j/6k)
-- Via Pseudometa (https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl)
map({ "n", "x" }, "<S-j>", "6j")
map({ "n", "x" }, "<S-k>", "6k")

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

--[[ Buffers ]]

-- Moving
map("n", "<leader><", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left", silent = true })
map("n", "<leader>>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right", silent = true })

-- Closing
map("n", "<leader>bd", function()
  require("mini.bufremove").delete()
end, { desc = "Close current buffer" })

--[[ Plugins ]]

-- Aerial
map({ "n" }, "<leader>co", "<cmd>AerialToggle<CR>", { desc = "Open symbol outline" })

-- CMP
map({ "n" }, "<C-y>", require("cmp").mapping.complete, { desc = "Select completion" })

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

-- Devdocs
wk.add({ "<leader>d", group = "+DevDocs" })
map("n", "<leader>dd", "<cmd>DevdocsOpenCurrentFloat<CR>", { desc = "Open DevDocs search (current language)" })
map("n", "<leader>ds", "<cmd>DevdocsOpenFloat<CR>", { desc = "Open DevDocs search (all languages)" })
map("n", "<leader>du", "<cmd>DevdocsUpdate<CR>", { desc = "Update DevDocs" })

-- Easy Commands
map("n", "<leader>t", "<cmd>Telescope commands<CR>", { desc = "Open easy commands", noremap = true })

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

-- Telescope (fuzzy finder)
local function telescope_git_fallback()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  local is_git_repo = vim.v.shell_error == 0

  if is_git_repo then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end
local function telescope_files()
  require("telescope.builtin").find_files({ cwd = vim.uv.cwd() })
end
local function telescope_oldfiles()
  require("telescope.builtin").oldfiles({ cwd = vim.uv.cwd() })
end
local function telescope_live_grep()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  local is_git_repo = vim.v.shell_error == 0
  local git_root = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h")

  require("telescope.builtin").live_grep({
    cwd = is_git_repo and git_root or vim.uv.cwd(),
  })
end
map("n", "<leader><space>", telescope_git_fallback, { desc = "Find files (git/fallback, cwd)" })
map("n", "<leader>ff", telescope_files, { desc = "Find files (cwd)" })
map("n", "<leader>fo", telescope_oldfiles, { desc = "Find files (cwd)" })
map("n", "<leader>f/", telescope_live_grep, { desc = "Live grep (cwd)" })
map("n", "<leader>,", require("telescope.builtin").buffers, { desc = "Find buffers" })

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
