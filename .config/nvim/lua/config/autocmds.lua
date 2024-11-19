--               --
-- AUTO COMMANDS --
--               --
local au = vim.api.nvim_create_autocmd

-- Color columns based on file file type
-- For multiple, use comma separation with no spaces
local color_columns = {
  ["gitcommit"] = "72",
  ["help"] = "0",
  ["markdown"] = "120", -- Based on prettier settings!
  -- Languages
  ["astro"] = "120", -- Based on prettier settings!
  ["asm"] = "0",
  -- ["c"] = "80",
  ["c"] = "120",
  ["cpp"] = "80",
  ["html"] = "120", -- Based on prettier settings!
  ["css"] = "120", -- Based on prettier settings!
  ["svelte"] = "120", -- Based on prettier settings!
  ["lua"] = "120",
  ["rust"] = "100",
}

for type, width in pairs(color_columns) do
  au({ "FileType", "BufEnter" }, {
    pattern = type,
    callback = function()
      -- Do not mess with the Obsidian vault
      local is_vault = string.find(vim.fn.expand("%:p"), "monolith", 0, true)
      if is_vault then
        return
      end
      -- print("Color columns at: " .. width)
      vim.wo.colorcolumn = width

      -- Only add text wrap if width can be a number
      local wrap_width = tonumber(width)
      if wrap_width ~= nil then
        -- print("Text wrapped at: " .. wrap_width)
        vim.bo.textwidth = wrap_width
      end
    end,
  })
end

local ft_remap = {
  ["hbs"] = "html",
  ["mdx"] = "markdown",
}

for base, remap in pairs(ft_remap) do
  au({ "BufNewFile", "BufRead" }, {
    pattern = "*." .. base,
    callback = function()
      -- vim.bo.filetype = remap
      vim.cmd("set ft=" .. remap)
    end,
  })
end

-- Set up terminal buffers
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Snacks terminal hack
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  pattern = "*",
  callback = function()
    local is_term = vim.api.nvim_buf_get_name(0):sub(1, 4) == "term"
    if not is_term then
      return
    end
    vim.opt_local.filetype = "snacks_terminal"
    vim.opt_local.colorcolumn = "0"
  end,
})

-- Keep all folds
local folds_augroup = vim.api.nvim_create_augroup("Folds", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost", "QuitPre" }, {
  group = folds_augroup,
  command = "mkview | filetype detect | set foldmethod=manual",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = folds_augroup,
  command = "silent! loadview | filetype detect | set foldmethod=manual | normal! zM",
})
