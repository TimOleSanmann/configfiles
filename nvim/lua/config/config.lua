vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"

vim.g.VM_maps = {
  ["Select Cursor Down"] = "<S-C-Down>",
  ["Select Cursor Up"] = "<S-C-Up>",
}

-- vim.cmd.colorscheme("gruvbox")
vim.cmd("colorscheme catppuccin-frappe")
