call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'BurntSushi/ripgrep'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'tpope/vim-commentary'
Plug 'f-person/git-blame.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'phaazon/hop.nvim'
call plug#end()

let g:gitblame_message_template = '<author> • <date> • <summary> • <sha>'

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noautoindent
set copyindent
set number
set termguicolors
set mouse=

lua require('tim/lsp')
lua require('tim/tree')
lua require('tim/autopairs')
lua require('tim/bufferline')
lua require('tim/lualine')
lua require('tim/treesitter')
lua require('tim/telescope')
lua require('tim/hop')

set background=dark
colorscheme gruvbox


nnoremap tt :NvimTreeToggle<CR>
nnoremap tf :NvimTreeFocus<CR>
nnoremap ts :NvimTreeFindFile 
nnoremap tp :NvimTreeResize +10<CR> 
nnoremap tm :NvimTreeResize -10<CR>
nnoremap tr :NvimTreeResize 
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>
nnoremap fs :Telescope git_status<CR>
nnoremap <Right> :bn<CR>
nnoremap <Left> :bp<CR>
nnoremap <Del> :bd<CR>
nnoremap <C-s> :mksession!<CR>
nnoremap mm :HopWord<CR>
nnoremap ml :HopLine<CR>
