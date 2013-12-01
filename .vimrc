" .vimrc - Sharnil Dalal

" pathogen to autoload bundles
filetype off
let g:pathogen_disabled = [ 'pathogen' ]    " don't load self
call pathogen#infect()                      " load everyhting else
call pathogen#helptags()                    " load plugin help files
filetype plugin indent on

" Color Scheme
colorscheme default
"colorscheme molokai
"let g:molokai_original = 1

" Syntax highlighting
syntax on
"au BufRead,BufNewFile * start "start vi in insert mode
au BufRead,BufNewFile * set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.cinc set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.tw set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.cconf set tabstop=4 shiftwidth=4 filetype=python
au BufRead,BufNewFile *.php set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim

" Line number and length
set number

" Spaces no tabs - makes arc lint happy
set expandtab

"Normal backspace behavior
set bs=2

" Search basics - incremental, highlight, show match
set incsearch
set showmatch
set hlsearch

" Vim auto reload on save
autocmd! bufwritepost .vimrc source %

"Set leaderkey
let mapleader = ","

"Ctrl+{P,N} capability
set completeopt=longest,menuone

"autocmd BufReadPre *.cconf :let b:did_pyflakes_plugin=1
"autocmd BufReadPre *.py :let b:did_pyflakes_plugin=0
"let g:pyflakes_use_quickfix = 1

"Powerline setup
set laststatus=2
set rtp+=/home/sharnil/.vim/bundle/powerline/powerline/bindings/vim

"enables auto closing of the preview window 
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Cursor highlight and shape [horizontal/vertical]
:set cursorline
":set cursorcolumn
:nnoremap <Leader>c :set cursorline!<CR>
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" This puts cursor back where from where you left
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
nnoremap <silent> <C-L> :noh<CR><C-L>

" highlight trailing whitespace "
match Error '\s\+$\|\t'

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
syn match tab display "\t"
"hi link tab Error
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
