return function(_, opts)
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
end
