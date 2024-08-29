-- Reassign leader
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", ":noh<cr>", { noremap = true, silent = true })

-- Buffer movement
vim.keymap.set("n", "<S-l>", ":BufferNext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":BufferPrevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bx", ":BufferClose<cr>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>bp", ":BufferPick<cr>", { noremap = true, silent = true, desc = "Pick buffer" })
vim.keymap.set("n", "<leader>bmn", ":BufferMoveNext<cr>", { noremap = true, silent = true, desc = "Buffer move next" })
vim.keymap.set("n", "<leader>bmp", ":BufferMovePrevious<cr>", { noremap = true, silent = true, desc = "Buffer move previous" })
vim.keymap.set("n", "<leader>bca", ":BufferCloseAllButCurrent<cr>", { noremap = true, silent = true, desc = "Buffer close all but current" })

-- Window
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wx", "<C-w>q", { noremap = true, silent = true, desc = "Close window" })
vim.keymap.set("n", "<leader>w-", ":split<cr>", { noremap = true, silent = true, desc = "Split window horizontal" })
vim.keymap.set("n", "<leader>w|", ":vsplit<cr>", { noremap = true, silent = true, desc = "Split window vertical" })
vim.keymap.set("n", "<leader>wh", ":windo wincmd H<cr>", { noremap = true, silent = true, desc = "Convert all splits to horizontal" })
vim.keymap.set("n", "<leader>wv", ":windo wincmd K<cr>", { noremap = true, silent = true, desc = "Convert all splits to vertical" })

-- NvimTree
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<cr>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<cr>", { noremap = true, silent = true, desc = "Focus NvimTree" })
vim.keymap.set("n", "<leader>el", ":NvimTreeResize +20<cr>", { noremap = true, silent = true, desc = "Increase NvimTree size" })
vim.keymap.set("n", "<leader>eh", ":NvimTreeResize -20<cr>", { noremap = true, silent = true, desc = "Decrease NvimTree size" })

-- LSP | Code Actions
vim.keymap.set('n', 'gD', vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true, desc = "LSP goto definition"})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true, desc = "LSP Hover"})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, noremap = true, silent = true, desc = "LSP goto implementation"})
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = bufnr, noremap = true, silent = true, desc = "LSP goto type definiton"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, noremap = true, silent = true, desc = "LSP diagnostics prev"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, noremap = true, silent = true, desc = "LSP diagnostics next"})
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true, desc = "LSP goto definition"})
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true, desc = "LSP Hover"})
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { buffer = bufnr, noremap = true, silent = true, desc = "LSP goto implementation"})
vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { buffer = bufnr, noremap = true, silent = true, desc = "LSP goto type definition"})
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = bufnr, noremap = true, silent = true, desc = "LSP rename"})
vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, { buffer = bufnr, noremap = true, silent = true, desc = "LSP code action"})
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_prev, { buffer = bufnr, noremap = true, silent = true, desc = "LSP diagnostics prev"})
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next, { buffer = bufnr, noremap = true, silent = true, desc = "LSP diafnostics next"})
vim.keymap.set('n', '<leader>ldh', vim.lsp.buf.document_highlight, { buffer = bufnr, noremap = true, silent = true, desc = "LSP document highlight"})
vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, { buffer = bufnr, noremap = true, silent = true, desc = "LSP diagnostics quickfix"})

-- Hop
vim.keymap.set('n', '<leader><leader>a', "<cmd>HopAnywhere<cr>", { noremap = true, silent = true, desc = "Hop anywhere"})
vim.keymap.set('v', '<leader><leader>a', "<cmd>HopAnywhere<cr>", { noremap = true, silent = true, desc = "Hop anywhere"})
vim.keymap.set('n', '<leader><leader>w', "<cmd>HopWord<cr>", { noremap = true, silent = true, desc = "Hop word"})
vim.keymap.set('v', '<leader><leader>w', "<cmd>HopWord<cr>", { noremap = true, silent = true, desc = "Hop word"})
vim.keymap.set('n', '<leader><leader>l', "<cmd>HopLine<cr>", { noremap = true, silent = true, desc = "Hop line"})
vim.keymap.set('v', '<leader><leader>l', "<cmd>HopLine<cr>", { noremap = true, silent = true, desc = "Hop line"})
vim.keymap.set('n', '<leader><leader>p', "<cmd>HopPattern<cr>", { noremap = true, silent = true, desc = "Hop pattern"})
vim.keymap.set('v', '<leader><leader>p', "<cmd>HopPattern<cr>", { noremap = true, silent = true, desc = "Hop pattern"})

-- Telescope
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<cr>", { noremap = true, silent = true, desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Telescope live grep"})
vim.keymap.set('n', '<leader>ft', ":Telescope grep_text<cr>", { noremap = true, silent = true, desc = "Telescope grep current text"})
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<cr>", { noremap = true, silent = true, desc = "Telescope buffers"})
vim.keymap.set('n', '<leader>fx', ":Telescope<cr>", { noremap = true, silent = true, desc = "Telescope"})
vim.keymap.set('n', '<leader>flr', ":Telescope lsp_references<cr>", { noremap = true, silent = true, desc = "Telescope lsp references"})
vim.keymap.set('n', '<leader>fld', ":Telescope lsp_definitions<cr>", { noremap = true, silent = true, desc = "Telescope lsp definitions"})

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" })
