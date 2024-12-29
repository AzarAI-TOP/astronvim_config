---@class toggle2config
local M = {}

M.directories = {
  last_dir = nil, -- 上一次工作目录
  config_dir = vim.fn.stdpath "config", -- Neovim 配置目录
}

-- INFO: 不需要在启动的时候初始化， 因为只会有两种初始状态，都不需要初始化last_dir

-- --- 在 Neovim 启动时初始化 last_dir
-- function M.Init_Last_Dir()
--   M.directories.last_dir = vim.fn.getcwd() -- 启动时获取当前目录
-- end

--- 切换到配置目录或返回上一个目录
function M.Toggle_Config()
  local current_dir = vim.fn.getcwd() -- 获取当前工作目录

  if current_dir == M.directories.config_dir then
    -- 当前在配置目录，尝试切换回上一次的目录
    if M.directories.last_dir then
      vim.cmd("cd " .. M.directories.last_dir)
      vim.notify("Switched back to: " .. M.directories.last_dir, vim.log.levels.INFO)
      M.directories.last_dir = nil -- 清除上一次的目录记录
    else
      vim.notify("No previous directory to switch to.", vim.log.levels.ERROR)
    end
  else
    -- 当前不在配置目录，记录当前目录并切换到配置目录
    M.directories.last_dir = current_dir
    vim.cmd("cd " .. M.directories.config_dir)
    vim.notify("Switched to AstroNvim config directory: " .. M.directories.config_dir)
  end
end

return M
