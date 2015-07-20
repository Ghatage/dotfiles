set shortmess+=I
set nu
set mouse=a
set wildmenu
syntax enable
set nofoldenable  
set foldmethod=syntax  
set foldlevel=20
set t_Co=256
set background=dark
"let g:solarizcodeschoolors=16
" colorscheme codeschool

" Key Mappings
:nnoremap <C-O> :MRU<CR>
:nnoremap <C-F> za

" Because I'm sloppy
:command WQ wq
:command Wq wq
:command W w
:command Q q

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

:cs add /home/ghatage/cscope.out
