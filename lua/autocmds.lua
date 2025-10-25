-- Disabled conceal for json file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  command = "setlocal conceallevel=0",
})

-- Auto read Plaintex as Tex file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "plaintex",
  command = "setlocal filetype=tex",
})

-- Auto switch Fcitx5 to English IME
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function() vim.fn.system("fcitx5-remote -c") end,
})

-- Auto read VerilogHeader as Verilog file
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.vh",
  callback = function() vim.bo.filetype = "verilog" end,
})
