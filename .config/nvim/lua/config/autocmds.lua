--               --
-- AUTO COMMANDS --
--               --
local au = vim.api.nvim_create_autocmd

-- Color columns based on file file type
-- For multiple, use comma separation with no spaces
local color_columns = {
  ["gitcommit"] = "72",
  ["help"] = "0",
  ["markdown"] = "80",
  -- Languages
  ["asm"] = "0",
  ["c"] = "80",
  ["cpp"] = "80",
  ["css"] = "80",
  ["svelte"] = "80",
  ["lua"] = "120",
  ["rust"] = "100",
}

for type, width in pairs(color_columns) do
  au({ "FileType", "BufEnter" }, {
    pattern = type,
    callback = function()
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

-- Automatically enter terminal insert mode
-- au("WinEnter", {
--   pattern = "*",
--   callback = function()
--     local is_term = vim.api.nvim_buf_get_name(0):match("^term") ~= nil
--     if is_term then
--       print("AUTO: insert mode")
--       vim.cmd("star") -- Enter insert mode
--     end
--   end,
-- })
