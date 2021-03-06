colorscheme badwolf
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Put your Plugins below VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVvvv
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'wincent/command-t'
Plugin 'lervag/vimtex'
Plugin 'itchyny/vim-cursorword'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

highlight Cursor guifg=orange guibg=white
highlight iCursor guifg=white guibg=red
set clipboard=unnamed

set hidden

set mouse=a
nnoremap ; :

" set nowrap " do not add line wrapping
set tabstop=4
filetype plugin indent on
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=4
set ignorecase
set smartcase
set cursorcolumn
set cursorline

set relativenumber
set number
" sets both relative number and actual line number on current line



map f <Plug>(easymotion-prefix)
" easymotion so you press ff to easymotion it!

set history=1000
set undolevels=100
set title

filetype plugin indent on
let s:pairs={}
set background=dark


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

syntax on
hi Visual term=reverse cterm=reverse guibg=white
hi Comment guifg=#32CD32
highlight MatchParen ctermfg=blue ctermbg=208 "highlights matching parentheses in orange and makes text blue
"""""""""""Autocomplete function"""""""""""
" function! ConditionalPairMap(open, close)
  " let line = getline('.')
  " let col = col('.')
  " if col < col('$') || stridx(line, a:close, col + 1) != -1
    " return a:open
  " else
    " return a:open . a:close . repeat("\<left>", len(a:close))
  " endif
" endf
" inoremap <expr> ( ConditionalPairMap('(', ')')
" inoremap <expr> { ConditionalPairMap('{', '}')
" inoremap <expr> [ ConditionalPairMap('[', ']')
" inoremap <expr> " ConditionalPairMap('"', '"')
" inoremap <expr> ' ConditionalPairMap("'", "'")


let g:livepreview_previewer = 'open -a Preview' "For Latex live previewing https://github.com/xuhdev/vim-latex-live-preview
autocmd BufNewFile,BufRead *.tex LLPStartPreview

set pastetoggle=<F2> " Press F2 to toggle paste

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
	  " For pasting without needing to set paste all the time
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "s": '#',
    \   "matlab": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
    if getline('.') =~ "^\\s*" . comment_leader . " " 
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else 
        if getline('.') =~ "^\\s*" . comment_leader
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
        else
            " Comment the line
            execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
        end
    end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>



"required for Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='dark'
set t_Co=256

set scrolloff=7

execute pathogen#infect()
