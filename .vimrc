set nocompatible

set hidden

set mouse=a
nnoremap ; :

set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set ignorecase
set smartcase

set history=1000
set undolevels=100
set title

filetype plugin indent on

set background=dark

syntax on
hi Visual term=reverse cterm=reverse guibg=Grey
hi Comment guifg=#32CD32



let s:comment_map = {
    \   "c": '// ',
    \   "cpp": '// ',
    \   "go": '// ',
    \   "java": '// ',
    \   "javascript": '// ',
    \   "php": '// ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "vim": '" ',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            execute "silent s/^" . comment_leader . "//"
        else
            " Comment the line
            execute "silent s/^/" . comment_leader . "/"
        endif
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>
