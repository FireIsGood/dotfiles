-- Copied from the official
return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "nat-418/cmp-color-names.nvim",
  },
  config = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local opts = {
      -- completion = {
      --   completeopt = "menu,menuone,noinsert",
      -- },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ["<S-CR>"] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        -- { name = "luasnip" },
        { name = "snippets" },
        { name = "emoji" },
        { name = "color_names" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = function(entry, item)
          -- Default stuff
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end

          -- Fix emmet (Agony)
          local ft = vim.bo[entry.context.bufnr].filetype
          local isEmmet = entry.source.name == "nvim_lsp" and item.kind == "Snippet" and ft == "css"
          if isEmmet then
            item.menu = ""
            item.kind = ""
          end

          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = {
        comparators = {
          -- Original order: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua#L62
          -- Definitions of compare function https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
          compare.offset,
          compare.recently_used, -- higher
          compare.score,
          compare.exact, -- lower
          compare.kind, -- higher (prioritize snippets)
          compare.locality,
          compare.length,
          compare.order,
        },
      },
    }

    require("cmp").setup(opts)
  end,
}
