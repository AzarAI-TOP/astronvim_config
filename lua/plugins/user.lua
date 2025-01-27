-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  -- Alpha
  {
    "goolord/alpha-nvim",
    opts = require "config/alpha",
  },
  -- Heirline
  {
    "rebelot/heirline.nvim",
    opts = require "config/heirline",
  },

  -- Onedark
  {
    "navarasu/onedark.nvim",
  },

  -- Better-Escape
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 300,
      default_mappings = false,
      mappings = {
        i = { j = { k = "<Esc>" } },
      },
    },
  },

  -- Hop
  {
    "phaazon/hop.nvim",
    lazy = true,
    opts = function(_, opts) opts.keys = "etovxqpdygfblzhckisuran" end,
  },

  -- Nvim-Autopairs
  {
    "windwp/nvim-autopairs",
    opts = require "config/nvim-autopairs",
  },

  -- LSP_Signature
  -- Show function signature when you type
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
  },

  -- Markview
  {
    "OXY2DEV/markview.nvim",
    opts = {
      preview = {
        icon_provider = "devincons",
      },
    },
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   Config = function(plugin, opts)
  --     Require "astronvim.plugins.configs.luasnip"(plugin, opts) -- Include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     Local luasnip = require "luasnip"
  --     Luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   End,
  -- },
}
