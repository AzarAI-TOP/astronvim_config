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
