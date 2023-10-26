-- Remap leader and local leader to <Space>
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Leader>z", ":Lazy<CR>", { silent = true })

vim.keymap.set("n", "tt", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "tf", ":NvimTreeFocus<CR>", { silent = true })

vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<Leader>q", ":bd!<CR>", { silent = true })

vim.keymap.set("n", "mm", ":HopWord<CR>", { silent = true })
vim.keymap.set("n", "ml", ":HopLine<CR>", { silent = true })
vim.keymap.set("n", "ma", ":HopAnywhere<CR>", { silent = true })
