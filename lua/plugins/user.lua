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

  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function(plugin, opts)
      -- Including Astronvim defualt configurations
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      -- Add custom ones from snippets folder
      require("luasnip.loaders.from_vscode").lazy_load { paths = "~/.config/nvim/snippets" }
    end,
  },

  -- Vimtex
  -- {
  --   "lervag/vimtex",
  --   -- tag = "v2.15", -- uncomment to pin to a specific release
  --   init = function()
  --     -- VimTeX configuration goes here, e.g.
  --     vim.g.vimtex_view_method = "zathura"
  --   end,
  -- },
}
