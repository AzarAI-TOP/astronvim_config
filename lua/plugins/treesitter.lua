-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "c",
      "cpp",
      "python",
      "markdown",
      "markdown_inline",
      "latex",
      "json",
      "jsonc",
      "bash",
      "regex",
    },
  },
}
