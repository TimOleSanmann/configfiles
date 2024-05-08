-- Reassign leader
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", ":noh<cr>", { noremap = true, silent = true })

-- Buffer movement
vim.keymap.set("n", "<S-l>", ":BufferNext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":BufferPrevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":BufferClose<cr>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>bmn", ":BufferMoveNext<cr>", { noremap = true, silent = true, desc = "Buffer move next" })
vim.keymap.set("n", "<leader>bmp", ":BufferMovePrevious<cr>", { noremap = true, silent = true, desc = "Buffer move previous" })
vim.keymap.set("n", "<leader>bca", ":BufferCloseAllButCurrent<cr>", { noremap = true, silent = true, desc = "Buffer close all but current" })

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wd", "<C-w>q", { noremap = true, silent = true, desc = "Close window" })
vim.keymap.set("n", "<leader>w-", ":split<cr>", { noremap = true, silent = true, desc = "Split window horizontal" })
vim.keymap.set("n", "<leader>w|", ":vsplit<cr>", { noremap = true, silent = true, desc = "Split window vertical" })

-- Config keymaps
local function toggleRelativeNumber()
    if vim.opt.relativenumber:get() then
	vim.opt.relativenumber = false
    else
	vim.opt.relativenumber = true
    end
end
local function toggleClipboard()
    local clipboard_setting = vim.o.clipboard
    
    print(clipboard_setting)
    if clipboard_setting == "unnamedplus" then
        print("Neovim now uses internal clipboard")
	vim.opt.clipboard = ""
    else
        print("Neovim now uses global clipboard")
	vim.opt.clipboard = "unnamedplus"
    end
end

vim.keymap.set("n", "<leader>cr", toggleRelativeNumber, { noremap = true, silent = true, desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<leader>cc", toggleClipboard, { noremap = true, silent = true, desc = "Toggle clipboard mode" })
vim.keymap.set("n", "<leader>csd", ":setlocal spell spelllang=de_de<cr>", { noremap = true, silent = true, desc = "Activate spellchecking german"})
vim.keymap.set("n", "<leader>cse", ":setlocal spell spelllang=en_us<cr>", { noremap = true, silent = true, desc = "Activate spellchecking english"})
vim.keymap.set("n", "<leader>csn", ":set nospell<cr>", { noremap = true, silent = true, desc = "Deactivate spellchecking"})

-- Hop
vim.keymap.set("n", "<leader><leader>w", ":HopWord<cr>", { noremap = true, silent = true, desc = "Hop Word"})

-- Resize
vim.keymap.set("n", "<leader><leader>l", ":vertical resize +10<cr>", { noremap = true, silent = true, desc = ""})
vim.keymap.set("n", "<leader><leader>h", ":vertical resize -10<cr>", { noremap = true, silent = true, desc = ""})
vim.keymap.set("n", "<leader><leader>k", ":resize +10<cr>", { noremap = true, silent = true, desc = ""})
vim.keymap.set("n", "<leader><leader>j", ":resize -10<cr>", { noremap = true, silent = true, desc = ""})

-- Markdown Preview
vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<cr>", { noremap = true, silent = true, desc = "Toggle Markdown Preview"})

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true, silent = true, desc = "Find file"})
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live Grep"})
vim.keymap.set("n", "<leader>fg", ":Telescope git_files<cr>", { noremap = true, silent = true, desc = "Find git files"})

-- Session
-- restore the session for the current directory
vim.keymap.set("n", "<leader>ps", [[<cmd>lua require("persistence").load()<cr>]], { desc = "Load session from this directory"})

-- restore the last session
vim.keymap.set("n", "<leader>pl", [[<cmd>lua require("persistence").load({ last = true })<cr>]], { desc = "Restore last session"})

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>pd", [[<cmd>lua require("persistence").stop()<cr>]], { desc = "Stop saving session" })

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" })

-- Diffview
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<cr>", { noremap = true, silent = true, desc = "Open diffview File History" })
vim.keymap.set("n", "<leader>do", ":DiffviewOpen<cr>", { noremap = true, silent = true, desc = "Open diffview open" })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<cr>", { noremap = true, silent = true, desc = "Open diffview close" })

-- LSP
vim.keymap.set("n", "<leader>lt", ":TroubleToggle<cr>", { noremap = true, silent = true, desc = "Toggle Trouble LSP" })

-- Vimux
vim.keymap.set("n", "<leader>vr", ":VimuxRunLastCommand<cr>", { noremap = true, silent = true, desc = "Vimux run last command" })
vim.keymap.set("n", "<leader>vo", ":VimuxOpenRunner<cr>", { noremap = true, silent = true, desc = "Vimux open runner" })
vim.keymap.set("n", "<leader>vc", ":VimuxCloseRunner<cr>", { noremap = true, silent = true, desc = "Vimux close runner" })

-- Signs
vim.keymap.set("n", "<leader>gd", ":Gitsigns toggle_deleted<cr>", { noremap = true, silent = true, desc = "Gitsigns toggle deleted" })
vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<cr>", { noremap = true, silent = true, desc = "Gitsigns toggle signs" })
