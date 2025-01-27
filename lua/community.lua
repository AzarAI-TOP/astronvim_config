-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Colorscheme
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },

  -- Movetion
  { import = "astrocommunity.motion.mini-move" },
}
