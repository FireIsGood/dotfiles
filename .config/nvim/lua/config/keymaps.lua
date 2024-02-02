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

-- floating terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root(), border = "rounded", size = { width = 0.8, height = 0.8 } })
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
map("n", "M", "J", { desc = "Merge" })

-- Funny esc meme
local EscapeInNorm = function()
  local keys = vim.api.nvim_replace_termcodes("<cmd>noh<cr><esc>", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", true)
  print("There is no escape.")
end
map("n", "<esc>", EscapeInNorm, {})
map("n", "<C-c>", EscapeInNorm, {})

-- Remove annoying highlights on exiting insert mode
map("i", "<esc>", "<cmd>noh<CR><esc>", { desc = "Escape and clear hlsearch" })
map("i", "<C-c>", "<cmd>noh<CR><C-c>", { desc = "Escape and clear hlsearch" })

-- Paragraph-wise jumps
map({ "n", "x" }, "<S-j>", "}", { desc = "Next paragraph" })
map({ "n", "x" }, "<S-k>", "{", { desc = "Previous paragraph" })

-- Saner z.
map("n", "z.", "zz", { desc = "Center this line", silent = true })

-- Yank and Paste with System clipboard via leader
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system clipboard", silent = true })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste after from system clipboard", silent = true })
map({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard", silent = true })

-- Go to the dashboard
cmd("QuitToDashboard", function()
  vim.cmd("Alpha")
  vim.cmd("Neotree close")
end, { desc = "Quit to the dashboard and close Neotree" })
map("n", "<leader>qw", "<cmd>QuitToDashboard<CR>")

cmd("Test", function()
  local git_dir = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
  print(git_dir ~= "")
end, { desc = "Check if the pwd is a git repo" })

-- Open the current working directory
map({ "n" }, "<leader>o", "<cmd>!open $PWD<CR><CR>", { desc = "Open PWD in a file explorer" })

--[[ Buffers ]]

-- Moving
map("n", "<leader><", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left", silent = true })
map("n", "<leader>>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right", silent = true })

--[[ Plugins ]]

-- Oil (file management via buffer) BUT IT'S BROKEN RIGHT NOW
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory", silent = true })

-- Comment with / in insert mode
map("i", "<C-_>", require("Comment.api").toggle.linewise.current, { desc = "Toggle line as comment" })

-- Code action hover
map("n", "gh", vim.lsp.buf.hover, { desc = "Hover" })

-- Harpoon (commands set in plugin file)
wk.register({ ["<leader>h"] = { name = "+Harpoon" } })
map("n", "<leader>hh", "<cmd>HarpoonMenu<CR>", { desc = "Open the Harpoon menu" })
map("n", "<leader>ha", "<cmd>HarpoonAddFile<CR>", { desc = "Add the current file to Harpoon" })
map("n", "<leader>j", "<cmd>HarpoonBuffer 1<CR>", { desc = "Go to buffer 1" })
map("n", "<leader>k", "<cmd>HarpoonBuffer 2<CR>", { desc = "Go to buffer 2" })
map("n", "<leader>l", "<cmd>HarpoonBuffer 3<CR>", { desc = "Go to buffer 3" })
map("n", "<leader>;", "<cmd>HarpoonBuffer 4<CR>", { desc = "Go to buffer 4" })

-- Scissors
wk.register({ ["<leader>i"] = { name = "+Snippets" } })
map("n", "<leader>ie", require("scissors").editSnippet, { desc = "Edit snippets" })
map({ "n", "x" }, "<leader>ia", require("scissors").addNewSnippet, { desc = "Add a snippet" })

-- Telescope (fuzzy finder)
local function telescope_relative()
  local is_git_repo = vim.fn.finddir(".git", vim.fn.getcwd() .. ";") ~= ""

  if is_git_repo then
    -- Git repo
    require("telescope.builtin").git_files()
    -- print("GIT GAMING")
  else
    -- Not a git repo
    require("telescope.builtin").find_files()
    -- print("GIT GOOD")
  end
end
map("n", "<leader><space>", telescope_relative, { desc = "Find in current directory" })
map("n", "<leader>,", require("telescope.builtin").buffers, { desc = "Find buffers" })

-- Undo tree
map("n", "<leader>fu", require("undotree").toggle, { desc = "Undo tree", silent = true })

-- Various Text Objects (basically just Entire Buffer)
-- Select all text
map({ "o", "x" }, "ae", "<cmd>lua require('various-textobjs').entireBuffer()<CR>")

--
--[[ Workspaces and Sessions ]]
--
wk.register({ ["<leader>w"] = { name = "+workspaces/sessions" } })

-- Workspaces
map("n", "<leader>wl", "<cmd>WorkspacesList<CR>", { desc = "List workspaces" })
map("n", "<leader>wo", "<cmd>Telescope workspaces<CR>", { desc = "Open workspace" })
map("n", "<leader>wa", ":WorkspacesAdd ", { desc = "Add workspace" })
map("n", "<leader>wr", ":WorkspacesRename ", { desc = "Rename workspace" })

-- Sessions
map("n", "<leader>ws", "<cmd>SessionsSave<CR>", { desc = "Save session" })
