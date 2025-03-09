return function(plugin, opts)
  require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- Include the default astronvim config that calls the setup call
  -- Add more custom autopairs configuration such as custom rules
  local npairs = require("nvim-autopairs")
  local Rule = require("nvim-autopairs.rule")
  local cond = require("nvim-autopairs.conds")
  -- Add rules
  npairs.add_rules({
    Rule("$", "$", { "tex", "latex" })
      -- Don't add a pair if the next character is %
      :with_pair(cond.not_after_regex("%%")),
  })
end
