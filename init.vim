" init.vim

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Create a JSX function abbreviation
iabbrev jsxfunc export default function <C-R>=JsxFunc()<CR>
iabbrev html <html><C-Enter>  <head><C-Enter></head><C-Enter><body><C-Enter></body><C-Enter></html>
iabbrev contenttype 'Content-Type': 'application/json'

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>s  :let @/ = '\<' . expand('<cword>') . '\>'<CR>:nohlsearch<CR>
nnoremap <silent> <LEFT> :vertical resize -2 <CR>
nnoremap <silent> <RIGHT> :vertical resize +2 <CR>
nnoremap <silent> <UP> :resize -2 <CR>
nnoremap <silent> <DOWN> :resize +2 <CR>
inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>

nnoremap <Leader>c 0i//<Esc>

function! JsxFunc()
    let funcname = input("Function name: ")
    return funcname . '() {}'
endfunction


" Set tab size to 4 spaces
set tabstop=2
" Set indentation width to 4 spaces
set shiftwidth=2
" Use spaces instead of tabs for indentation
set expandtab
set path+=.,src/**
set relativenumber
set number
set nohlsearch

" Plugin definitions
" Syntax highlighting and indentation
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sainnhe/everforest'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'kylechui/nvim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

" Configure stylelint-lsp language server
au User lsp_setup call lspconfig#stylelint#setup({})

" Initialize plugin system
call plug#end()

set termguicolors

set background=dark
let g:everforest_background = 'hard'
colorscheme everforest

autocmd FileType javascript setl formatprg=eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+$//e
autocmd FileType typescript setl formatprg=eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+$//e
autocmd FileType typescriptreact setl formatprg=eslint\ --stdin\ --stdin-filename\=%\ --fix\|%s/\s\+$//e
