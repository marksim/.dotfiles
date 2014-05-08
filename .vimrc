set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here
Bundle 'vim-scripts/QuickBuf'
Bundle 'mileszs/ack.vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tangledhelix/vim-octopress'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-bundler'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-fugitive'
Bundle 'sleistner/vim-jshint'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'mattn/webapi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tyru/open-browser.vim'
Bundle 'tyru/open-browser-github.vim'

set ruler
set number
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set noswapfile
syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set autoindent
set pastetoggle=<C-p>
set grepprg=ack

set wildignore+=tmp/**

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set clipboard=unnamed

set ttimeoutlen=50

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


let mapleader=","
imap <C-l> <space>=><space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test functions from gary bernhardt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\|_test.exs\|_test.spec.js\|_test.py\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("../script/test")
            exec ":!../script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

"autocmd BufWritePost *.exs :call RunTestFile()
"autocmd BufWritePost *.py :call RunTestFile()
"autocmd BufWritePost *.rb :call RunTestFile()
"autocmd BufWritePost *.js :call RunTestFile()

nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTestFile()<cr>

 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T remaps 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>r :NERDTreeFind<CR>
let g:qb_hotkey = "<F6>"


"if &term =~ "xterm" || &term =~ "screen"
  "let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  "let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  "let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
  "let g:CommandTFlush         = ['<C-l>']
"endif

"augroup CommandTExtension
  "autocmd!
  "autocmd FocusGained * CommandTFlush
  "autocmd BufWritePost * CommandTFlush
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" only open NERDTree on load if there are no arguments passed to vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if argc() == 0
"  autocmd vimenter * NERDTree
end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader mappings for swapping split panes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

function! RemoveFile()
  exec ":call delete(expand('%'))"
  exec ":bd!"
endfunction

nmap <silent> <leader>dd :call RemoveFile()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always strip trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Octopress 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:octopress_rake_executable = "noglob rake" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>g :Gstatus<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-rspec 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>R :RunSpec<cr>
map <Leader>L :RunSpecLine<cr>
let g:RspecSplitHorizontal=0

" Open Marked.app
" only works on OSX with Marked.app installed
imap <Leader>m <ESC>:!open -a Marked.app "%"<CR><CR>
nmap <Leader>m :!open -a Marked.app "%"<CR><CR>

" CTags
map <Leader><Tab> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Search
nmap \ :Ack! 

""""
" 
"""'
fun! ResizeWindowIfTooSmall()
  if winwidth('%') < 80 
    wincmd =
    :vertical resize 80
  end
endfun

autocmd! BufEnter * call ResizeWindowIfTooSmall()
autocmd! BufEnter NERD_Tree_1 :vertical resize 31

