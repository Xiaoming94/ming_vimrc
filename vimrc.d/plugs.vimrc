" Plugins
function! LoadEnvPlugs()
    if filereadable(expand("~/.vimrc.d/specific.plugs.vimrc"))
        source ~/.vimrc.d/specific.plugs.vimrc
    endif
endfunction

call plug#begin()
    source ~/.vimrc.d/common.plugs.vimrc

    " NERDTree
    Plug 'preservim/nerdtree'

    " Color previewer
    Plug 'BourgeoisBear/clrzr'

    " Load YCM if there is python3
    if has('python3')
        Plug 'ycm-core/YouCompleteMe'
    endif

    " Git integration
    Plug 'mhinz/vim-signify'         " Showing edits and diffs

    " Colorschemes
    Plug 'sickill/vim-monokai'
    call  LoadEnvPlugs()

call plug#end()

" vim: set ft=vim
