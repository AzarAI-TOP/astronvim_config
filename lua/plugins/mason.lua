-- Customize Mason plugins

---@type LazySpec
return {
  -- Use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- Overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        -- Add more arguments for adding more language servers
      },
    },
  },
  -- Use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- Overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        -- Add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- Overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- Add more arguments for adding more debuggers
      },
    },
  },
}
