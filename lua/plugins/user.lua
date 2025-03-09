-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  -- Alpha
  {
    "goolord/alpha-nvim",
    opts = require("config/alpha"),
  },
  -- Heirline
  {
    "rebelot/heirline.nvim",
    opts = require("config/heirline"),
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
    opts = {
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
    },
    config = require("config/nvim-autopairs"),
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

      local presets = require("markview.presets")
      opts.markdown = {
        headings = presets.headings.slanted,
      }
    end,
  },

  -- Nvim-Cmp
  {
    "hrsh7th/nvim-cmp",
    opts = require("config/nvim-cmp"),
  },

  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      -- Configure plugin
      require("luasnip.config").setup({
        enable_autosnippets = true,
      })
      -- Load snippets
      require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
    end,
  },

  -- Disabled default built-in plugins
  --
  -- friendly-snippets : unfamiliar snippets
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
