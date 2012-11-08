set nocompatible
set showmatch
set guioptions-=T
set ruler
set incsearch
set nowrapscan
set ffs=unix,dos
" set number
if version >= 700
    set spell
    "highlight SpellBad cterm=standout
   " ctermbg=7 
endif
syntax enable
" Make bad spelling have a light grey background

" Show tabs and trailing characters.
"set listchars=tab:»·
"set list
call pathogen#infect()

filetype plugin indent on

let g:solarized_termcolors= 16
let g:solarized_termtrans = 1
let g:solarized_underline = 1

colorscheme solarized

set bg=dark

" Don't highlight words that match searches
set nohlsearch
set textwidth=78
set softtabstop=4
set shiftwidth=4
" Always use spaces instead of tabs
set expandtab
set hidden
set ignorecase

map <F1> :set bg=dark<CR>
map <F2> :set nospell<CR>
map <F3> :grep -i <C-R><C-W> *.tj* <CR>
map <F4> :wa<Enter>
map <F6> :wall<Enter>:make<Enter>
    " Grep open buffers - require bufgrep plugin
    map <F3> :Bgrep "\<<C-R><C-W>\>" <CR>
map <F10> :cl<Enter>
map <F11> :cp<Enter>
map <F12> :cn<Enter>
map <C-UP> :n<Enter>
map <C-DOWN> :N<Enter>
map <A-LEFT> :N<Enter>
map <A-RIGHT> :n<Enter>
"map <F3> /<<<<<<<<ESC>
map <C-ESC> :q<Enter>
set pastetoggle=<INSERT>
map <C-S> :w<Enter>
imap <C-D> <C-R>=strftime("%A, %d %B %Y")<CR>
iabbrev thetime <C-R>=strftime("%H:%M:%S")<CR>

" Map omni complete to be ctrl-space like eclipse
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

if has("autocmd")
autocmd BufEnter *.txt set ft=asciidoc
autocmd BufEnter *.h set ft=c
" Filetypes (au = autocmd)
" in makefiles, don't expand tabs to spaces, since actual tab characters
" are
" needed, and have indentation at 8 chars to be sure that all indents
" are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8
"au FileType asciidoc map <F6> :wall<Enter>:!asciidoc -b html5 -a icons -a toc2 -a theme=flask %<Enter>:![ -f Makefile ] && make -s<Enter>
    au FileType asciidoc map <F6> :wall<Enter>:!asciidoc -a toc -a data-uri %<Enter>:![ -f Makefile ] && make -s<Enter>
    au FileType asciidoc setlocal wrap formatoptions=tcqnaw
    au FileType asciidoc nnoremap Q gq}
    au FileType asciidoc setlocal comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
    au FileTYpe asciidoc setlocal autoindent

"    au FileType c set foldmethod=indent 
    au FileType c compiler gcc
    au FileType c set softtabstop=4       " no line numbers when
    au FileType c set smarttab
    au FileType c set shiftwidth=4
    au FileType c set expandtab
    au FileTYpe c set smartindent
    au FileType c set autoindent
    au FileType c set ignorecase spell
"    au FileType c set cino=>1sf1s{1sn-2
    au FileType c set path+=include
    au FileType c map <F6> :wall<Enter>:make -s htrak<Enter>
    au FileType c imap <c-d> /**<CR><CR>@param<CR>@return<CR>/
    au FileType c imap <c-e> extern<Space>
    au FileType c map <F2> /<<<<<<<CR>
" HTML filetype
    au FileType cvs set spell
" Haskell
    au FileType haskell set nospell
    au FileType haskell map <F2> :set spell<CR>
    au FileType html set ignorecase spell softtabstop=2 shiftwidth=2 smartindent
"    au FileType html set noautoindent
    au FileType html imap <c-l> <li><CR></<UP><CR>
    au FileType html imap <c-o> <ol><CR></<UP><CR>
    au FileType html imap <c-u> <ul><CR></<UP><CR>
    au FileType html imap <c-f> <pre><CR></<UP><CR>
    au FileType html imap <c-g> <p><CR></<UP><CR>
    au FileType html imap <c-z> <h1></<LEFT><LEFT><LEFT><LEFT><LEFT>
    au FileType html imap <c-x> <h2></<LEFT><LEFT><LEFT><LEFT><LEFT>
    au FileType html imap <c-c> <h3></<LEFT><LEFT><LEFT><LEFT><LEFT>
    au FileType html imap <c-v> <h4></<LEFT><LEFT><LEFT><LEFT><LEFT>
    au FileType html imap <C-b> <b></<LEFT><LEFT><LEFT><LEFT>
    au FileType html imap <C-t> <i></<LEFT><LEFT><LEFT><LEFT>
    au FileType html imap <c-a> <a href=""></<LEFT><LEFT><LEFT><LEFT>
    au FileType python setl modeline autoindent smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
    au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
    au FileType python map <F6> :wall<Enter>:let pyerrors=system("pycheck " . expand("%"))<Enter>:echo pyerrors<Enter>
" <Enter>:echo pyerrors<Enter>
    au FileType python map <F10> :echo pyerrors<Enter>
    au FileType python set textwidth=0
    "au FileType python compiler pylint
    au FileType python set tags+=$HOME/.vim/tags/python.ctags
    au FileType ruby compiler ruby
    " Syntax check only
    au FileType ruby map <F5> :wall<CR>:make -c %<CR>
    " Rake
    au FileType ruby map <F6> :wall<CR>:!rake <CR>
    " Compile current buffer
    au FileType ruby map <F7> :wall<CR>:make %<CR>

    au FileType sh set textwidth=0
    au FileType sh set softtabstop=4
    au FileType sql set ignorecase softtabstop=4
    au FileType sql set nosmartindent
    au FileType sql set noautoindent
    au FileType sql set textwidth=0
    au FileType sql vmap <F7> y:exec "!sqlrun $DBLOGIN '" . @" . "'"<CR>
    au FileType sql vmap <F8> y:exec "!echo '" . @" . "'"<CR>
    au FileType conf set ignorecase textwidth=0
    au FileType asciidoc set spell
    " Sidebar blocks
    au FileType asciidoc imap <F1> ********************************************************************************
    " Literal blocks
    au FileTYpe asciidoc imap <F2> ................................................................................ 
    " Listing blocks
    au FileTYpe asciidoc imap <F3> -------------------------------------------------------------------------------- 
    " Example block
    au FileType asciidoc imap <F3> ================================================================================ 
    " Table
    au FileType asciidoc imap <c-t> \|=============================================================================== 
    autocmd BufEnter *.pc.c set ft=text 
    autocmd BufEnter *.pc set ft=c

    au FileType spec setlocal textwidth=0

    " TaskJuggler
    au FileType tjp set softtabstop=4 shiftwidth=4
    " Save and then syntax check taskjuggler
    map <F6> :wall<CR>:make dev_plan.tjp <CR>
    
" c indenting options
" >1s = Amount added for a normal indent (1xshiftwidth)
" f1s = Indent of first opening brace
" {1s = Indenting of braces within other braces 

				
endif

