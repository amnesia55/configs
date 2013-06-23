:syntax on
set expandtab
filetype on
filetype indent on
filetype plugin on
"autocmd BufReadPre *.cconf :let b:did_pyflakes_plugin=1
autocmd BufReadPre *.py :let b:did_pyflakes_plugin=1

"enable pathogen"
execute pathogen#infect()

"setup pydiction"
let g:pydiction_menu_height = 20
let g:pydiction_location = '/home/sharnil/.vim/bundle/pydiction/complete-dict'

colorscheme default

" use control-n twice to show line numbers
:nmap <silent> <C-P> :set invnumber<CR>
:set invnumber
"autocmd VimEnter * set invnumber

" underline current line
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
:set cursorline!
:nnoremap <Leader>c :set cursorline!<CR>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim
au BufRead,BufNewFile * set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.phpt set filetype=php
au BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.cinc set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.tw set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.cconf set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.php set tabstop=2 shiftwidth=2

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
nnoremap <silent> <C-L> :noh<CR><C-L>

" highlight trailing whitespace "
match Error '\s\+$\|\t'

" always show status line with file name and position "
set laststatus=1

" interactive search"
set incsearch
set showmatch

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
syn match tab display "\t"
hi link tab Error
" to fix run :retab

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
" kill any trailing whitespace on save
autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,text
  \ autocmd BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()
