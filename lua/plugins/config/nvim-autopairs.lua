return function(plugin, opts)
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
        :with_pair(cond.not_before_regex("xxx", 3))
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
end
