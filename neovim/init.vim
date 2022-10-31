let g:airline_theme="deus"

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-t> :NERDTreeFocus<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set number
