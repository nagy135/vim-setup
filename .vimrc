syntax on

" Settings {{{
set tabstop=4
set expandtab
set shiftwidth=4
set relativenumber
set sts=4
set ts=4
set autoindent
set cursorline
set cursorcolumn
set wildmenu
set showcmd
set showmatch
set incsearch
set hlsearch
set number
set lazyredraw
set noshowmode
"}}}

"Mappings {{{
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <c-s> :source ~/.vimrc<CR>
nnoremap <c-n> :call DeleteFunctionUnderCursor()<CR>
"}}}

"AutoCommands {{{
autocmd FileType matlab nnoremap gcc I%<space><esc>
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:indentLine_char = '|'
let g:molokai_original = 1
colorscheme molokai

" Toggle between number and relativenumber {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
"}}}
"
" Deletes function call and its brackets when hovered over function name {{{
function! DeleteFunctionUnderCursor()
    let line = getline('.')
    normal diwxml
    let i = 1
    let c = 1
    while i <= strlen(line)
        let char = getline('.')[col('.') - 1]
        if (char == '(')
            let c += 1
        elseif (char == ')')
            let c -= 1
        endif
        if (c == 0)
            normal x`l
            break
        endif
        normal l
        let i += 1
    endwhile
endfunc
"}}}

" Plug commands {{{
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi'
Plug 'Raimondi/delimitMate'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
call plug#end()
"}}}
