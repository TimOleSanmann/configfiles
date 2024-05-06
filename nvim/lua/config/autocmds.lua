local function augroup(name)
  return vim.api.nvim_create_augroup("mnv_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup "highlight_yank",
  pattern = "*",
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  callback = function()
    vim.cmd([[ setfiletype coffee ]])
  end,
  group = augroup "ft",
  pattern = "*.coffee",
})
