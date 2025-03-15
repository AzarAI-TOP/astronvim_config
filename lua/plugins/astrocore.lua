-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       As this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- Set global limits for large files for disabling features like treesitter
      autopairs = true, -- Enable autopairs at start
      cmp = true, -- Enable completion at start
      diagnostics_mode = 3, -- Diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- Highlight URLs at start
      notifications = true, -- Enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- Vim options can be configured here
    options = {
      opt = { -- Vim.opt.<key>
        number = true, -- Sets vim.opt.number
        relativenumber = false, -- Sets vim.opt.relativenumber
        spell = false, -- Sets vim.opt.spell
        signcolumn = "yes", -- Sets vim.opt.signcolumn to yes
        wrap = false, -- Sets vim.opt.wrap
        smartcase = true, -- Sets vim.opt.smartcase
        autoread = true,
        swapfile = true,
      },
      g = { -- Vim.g.<key>
        -- Configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
  },
}
