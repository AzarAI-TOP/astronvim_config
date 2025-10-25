---@type AstroCoreMappings
local maps = require("astrocore").empty_map_table()

-- Leader
maps.n["<Leader><Leader>"] = { "", desc = "Cancel Leader" }

-- Buffer Management
maps.n["<M-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" }
maps.n["<M-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" }
maps.n["<Leader>b1"] = { function() require("astrocore.buffer").nav_to(1) end, desc = "Switch to buffer 1" }
maps.n["<Leader>b2"] = { function() require("astrocore.buffer").nav_to(2) end, desc = "Switch to buffer 2" }
maps.n["<Leader>b3"] = { function() require("astrocore.buffer").nav_to(3) end, desc = "Switch to buffer 3" }
maps.n["<Leader>b4"] = { function() require("astrocore.buffer").nav_to(4) end, desc = "Switch to buffer 4" }
maps.n["<Leader>b5"] = { function() require("astrocore.buffer").nav_to(5) end, desc = "Switch to buffer 5" }
maps.n["<Leader>b6"] = { function() require("astrocore.buffer").nav_to(6) end, desc = "Switch to buffer 6" }
maps.n["<Leader>b7"] = { function() require("astrocore.buffer").nav_to(7) end, desc = "Switch to buffer 7" }
maps.n["<Leader>b8"] = { function() require("astrocore.buffer").nav_to(8) end, desc = "Switch to buffer 8" }
maps.n["<Leader>b9"] = { function() require("astrocore.buffer").nav_to(9) end, desc = "Switch to buffer 9" }

-- Hop
maps.n["F"] = { function() require("hop").hint_char1() end, desc = "Hop move in this screen" }
maps.n["f"] = { function() require("hop").hint_char1 { current_line_only = true } end, desc = "Hop move in this line" }

-- Change current directory to nvim configurations
maps.n["<F12>"] = { function() require("utils").toggle_config() end, desc = "Neovim configuration" }

-- Store the changes
require("astrocore").set_mappings(maps)
