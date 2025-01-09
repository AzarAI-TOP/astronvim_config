-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  -- Alpha
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- Customize the dashboard header
      opts.section.header.val = {
        " █████╗ ███████╗ █████╗ ██████╗  █████╗ ██╗",
        "██╔══██╗╚══███╔╝██╔══██╗██╔══██╗██╔══██╗██║",
        "███████║  ███╔╝ ███████║██████╔╝███████║██║",
        "██╔══██║ ███╔╝  ██╔══██║██╔══██╗██╔══██║██║",
        "██║  ██║███████╗██║  ██║██║  ██║██║  ██║██║",
        "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝",
      }
      return opts
    end,
  },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      -- Add mode text at the beginning of statusline
      local status = require "astroui.status"
      opts.statusline[1] = status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }
      opts.winbar = { -- Create custom winbar
        -- Store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- Pick the correct winbar based on condition
        -- Inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- Show the path to the file relative to the working directory
          status.component.separated_path {
            path_func = status.provider.filename { modify = ":.:h" },
          },
          -- Add the file name and icon
          status.component.file_info {
            file_icon = {
              hl = status.hl.file_icon "winbar",
              padding = { left = 0 },
            },
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        -- Active winbar
        {
          -- Show the path to the file relative to the working directory
          status.component.separated_path {
            path_func = status.provider.filename { modify = ":.:h" },
          },
          -- Add the file name and icon
          status.component.file_info { -- Add file_info to breadcrumbs
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
          },
          -- Show the breadcrumbs
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
          },
        },
      }
    end,
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
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- Include the default astronvim config that calls the setup call
      -- Add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- Don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- Don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- Don't move right when repeat character
            :with_move(cond.none())
            -- Don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- Disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- Disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
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
