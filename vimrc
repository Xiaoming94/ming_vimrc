" .vimrc vim config file
" Author: Xiaoming94

" Setting up vimplug
source ~/.vimrc.d/plugs.vimrc

" Sourcing common configs
source ~/.vimrc.d/common.vim

" Make sure that vim has python compatibility before
" Initialising powerline
if has('python3')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
    let g:powerline_pycmd="py3"
    let g:Powerline_symbols='fancy'
endif

set encoding=utf-8
set laststatus=2


" Colorscheme and syntax highlighting
syntax on
colorscheme molokai
let g:molokai_original=1

" Mouse support
set mouse=a
" Autostart GitSign
let g:gitsign#auto_enable=1
let g:gitsign#highlight#enable_lines = 0 "Git diff lines highlights are kinda obnoxious...
let g:gitsign#highlight#enable_marks = 1

" Set vim swap directory
set directory^=$HOME/.vim/swap//

" Keybindings

" NERDTreeToggle
nnoremap <C-g>t : NERDTreeToggle<CR>

let &t_ut=''
" Source configs that are environmental dependant
function! SourceOptional()
    if filereadable(expand("~/.vimrc.d/useradded.vimrc"))
        source ~/.vimrc.d/useradded.vimrc
    endif

    if filereadable(expand("~/.vimrc.user"))
        source ~/.vimrc.user
    endif
endfunction

call SourceOptional()
