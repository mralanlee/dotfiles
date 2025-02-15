local api = vim.api
local autocmd = vim.api.nvim_create_autocmd

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end,
  buffer = 0
})

autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end
})
