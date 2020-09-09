set nu
set numberwidth=1
set t_Co=256

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
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
call plug#end()

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-tailwindcss', 'coc-prisma', 'coc-css', 'coc-prettier']
autocmd VimEnter * GitGutterLineHighlightsEnable
colorscheme codedark
let g:airline_theme='codedark'
highlight Normal ctermbg=None
highlight LineNr ctermbg=None
highlight EndOfBuffer ctermbg=None
highlight SignColumn ctermbg=None
highlight VertSplit ctermbg=None
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
set encoding=UTF-8
highlight Comment cterm=italic
set shiftwidth=2
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <C-p> :<C-u>FZF<Cr>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR> 
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
