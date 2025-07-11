---@type AstroCoreMappings
local maps = require("astrocore").empty_map_table()

-- Leader
maps.n["<Leader><Leader>"] = { "", desc = "Cancel Leader" }

-- ESC
maps.i["jk"] = { "<ESC>", desc = "Esc" }

-- Chord Mappings
maps.n["<C-a>"] = { "ggVG", desc = "Select all" }
maps.n["<C-s>"] = { "<Cmd>silent! update! | redraw<CR>", desc = "Write" }
maps.i["<C-s>"] = { "<Esc><Cmd>silent! update! | redraw<CR>", desc = "Write" }
maps.x["<C-s>"] = maps.i["<C-s>"]
maps.n["<C-q>"] = { "<Cmd>confirm qall<CR>", desc = "Quit Neovim" }

-- Leader Mappings
maps.n["<Leader>q"] = { "<Cmd>confirm q<CR>", desc = "Quit windows" }
maps.n["<Leader>Q"] = { "<Cmd>confirm qall<CR>", desc = "Quit Neovim" }
maps.n["<Leader>w"] = { "<Cmd>confirm w<CR>", desc = "Write" }
maps.n["<Leader>W"] = { "<Cmd>w !sudo tee % > /dev/null<CR>", desc = "Force Write" }

-- Motions
maps.n["H"] = { "^", desc = "Move caret to the beginning of line" }
maps.n["L"] = { "$", desc = "Move caret to the ends of line" }
maps.v["H"] = maps.n["H"]
maps.v["L"] = maps.n["L"]
maps.o["H"] = maps.n["H"]
maps.o["L"] = maps.n["L"]
maps.n["<C-d>"] =
  { function() require("neoscroll").scroll(0.5, { duration = 100 }) end, desc = "Scroll down a third screen" }
maps.n["<C-u>"] =
  { function() require("neoscroll").scroll(-0.5, { duration = 100 }) end, desc = "Scroll up a third screen" }
maps.n["[r"] = { function() require("illuminate").goto_prev_reference() end, desc = "Move to last reference" }
maps.n["]r"] = { function() require("illuminate").goto_next_reference() end, desc = "Move to next reference" }

-- Plugin Management
maps.n["<Leader>pl"] = { "<Cmd>Lazy<CR>", desc = "Lazy" }
maps.n["<Leader>pm"] = { "<Cmd>Mason<CR>", desc = "Mason" }

-- Buffer Management
maps.n["<M-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" }
maps.n["<M-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" }

-- Hop
maps.n["F"] = { function() require("hop").hint_char1() end, desc = "Hop move in this screen" }
maps.n["f"] = { function() require("hop").hint_char1({ current_line_only = true }) end, desc = "Hop move in this line" }

-- LSP
-- ...

-- Custom
maps.n["<F1>"] = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "Toggle horizontally" }
maps.t["<F1>"] = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm horizontally" }
maps.i["<F1>"] = { "<Esc><Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "Toggle horizontally" }

maps.n["<C-F1>"] = { "<Cmd>ToggleTerm size=75 direction=vertical<CR>", desc = "Toggle vertically" }
maps.t["<C-F1>"] = { "<Cmd>ToggleTerm size=75 direction=vertical<CR>", desc = "ToggleTerm vertically" }
maps.i["<C-F1>"] = { "<Esc><Cmd>ToggleTerm size=75  direction=vertical<CR>", desc = "Toggle vertically" }

maps.n["<F11>"] = {
  function() require("utils").convert_chinese_punctuation_to_english() end,
  desc = "Mapping Chinese punctuation to English ones",
}
maps.i["<F2>"] = maps.n["<F11>"]

maps.n["<F12>"] = { function() require("utils").toggle_config() end, desc = "Neovim configuration" }

return maps
