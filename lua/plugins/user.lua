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

  -- Neoscroll
  {
    "karb94/neoscroll.nvim",
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
    opts = function(_, opts)
      opts.preview = {
        icon_provider = "devincons",
      }

      local presets = require "markview.presets"
      opts.markdown = {
        headings = presets.headings.slanted,
      }
    end,
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

  -- Nvim-Cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "luasnip", priority = 1000 },
        { name = "nvim_lsp", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }
    end,
  },

  -- Friendly-snippets
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
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
