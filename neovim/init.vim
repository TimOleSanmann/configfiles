let g:airline_theme='deus'

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
call plug#end()
