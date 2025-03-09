return function(_, opts)
  -- opts parameter is the default options table
  -- the function is lazy loaded so cmp is able to be required
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  -- modify the sources part of the options table
  opts.sources = cmp.config.sources({
    { name = "luasnip", priority = 1000 },
    { name = "nvim_lsp", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  })
  -- mapping for completion
  opts.mapping = {
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end),

    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end
