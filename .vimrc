call pathogen#infect()
call pathogen#helptags()

set ruler
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set autoindent
set pastetoggle=<C-p>
set grepprg=ack

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let mapleader=","

noremap <F5> :CommandTFlush<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let g:qb_hotkey = "<F6>"

if argc() == 0
"  autocmd vimenter * NERDTree
end

set wildignore+=tmp/**

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

set ttimeoutlen=50

if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
  let g:CommandTFlush         = ['<C-l>']
endif

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
filetype plugin indent on

