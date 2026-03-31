" Common settings for both vim and neovim

" Set tabs
set tabstop=4
set softtabstop=4
set expandtab

" Syntax highlighting
syntax on

" Misc options
set splitright
set splitbelow
set cursorline
set number
set termguicolors

" Source configs that are environment dependant
function! SourceOptional()
    if filereadable(expand("~/.vimrc.d/useradded.vimrc"))
        source ~/.vimrc.d/useradded.vimrc
    endif

    if filereadable(expand("~/.vimrc.user"))
        source ~/.vimrc.user
    endif
endfunction

call SourceOptional()
