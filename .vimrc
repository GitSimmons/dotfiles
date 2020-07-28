" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
set backupdir=~/.vim/.backup//
set directory=~/.vim/.backup//
" silent execute '!del "~/.vim/.backup/*~"'
set nobackup
set nowritebackup
if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" BEN's options
set nu
set numberwidth=1

" Install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'jparise/vim-graphql'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

autocmd VimEnter * GitGutterLineHighlightsEnable
colorscheme codedark
let g:airline_theme='codedark'
"Set some blacks for my OLED Screen
highlight Normal ctermbg=None
highlight LineNr ctermbg=None
highlight EndOfBuffer ctermbg=None
highlight SignColumn ctermbg=None
highlight VertSplit ctermbg=None
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
set encoding=UTF-8
highlight Comment cterm=italic
set shiftwidth=2
"let mapleader = ','
"<C-p> to use FZF for file navigation
nnoremap <C-p> :<C-u>FZF<Cr>
"Maps for moving through buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"Maps for moving through count
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR> 
"command to wipe all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
