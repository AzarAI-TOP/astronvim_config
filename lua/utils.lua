-- Utility Functions

---@class utils
local M = {}

-- Toggle to Config Directory

M.dir_mem = {
  last_dir = nil,
  config_dir = vim.fn.stdpath("config"),
}

--- Toggle between workspace and configuration directory
function M.toggle_config()
  local current_dir = vim.fn.getcwd() -- Get current directory

  if current_dir == M.dir_mem.config_dir then
    -- When in configuration directory, switch to workspace
    if M.dir_mem.last_dir then
      vim.cmd("cd " .. M.dir_mem.last_dir)
      vim.notify("Switched back to: " .. M.dir_mem.last_dir, vim.log.levels.INFO)
      M.dir_mem.last_dir = nil -- Clean last item
    else
      vim.notify("No previous directory to switch to.", vim.log.levels.ERROR)
    end
  else
    -- When in workspace, switch to configuration directory
    M.dir_mem.last_dir = current_dir
    vim.cmd("cd " .. M.dir_mem.config_dir)
    vim.notify("Switched to AstroNvim config directory: " .. M.dir_mem.config_dir)
  end
end

return M
