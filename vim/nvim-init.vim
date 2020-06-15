source ~/dotfiles/vim/vimrc

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/')
  call dein#begin('~/.config/nvim/')

  " Let dein manage dein
  call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim')

  " Git support
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  " Assortment of syntax/indent support for many languages, including
  " typescript and jsx
  call dein#add('sheerun/vim-polyglot')

  " VSCode style autocomplete
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  " Preview css colors in files
  " TODO: turn off highlights for named colors like 'teal'
  call dein#add('ap/vim-css-color')

  call dein#add('drewtempelmeyer/palenight.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set background=dark
set termguicolors
let g:palenight_terminal_italics=1
let g:palenight_color_overrides = {
      \ 'red': { 'gui': '#f07178', 'cterm': '204', 'cterm16': '1' },
      \ 'light_red': { 'gui': '#ff8b92', 'cterm': '204', 'cterm16': '1' },
      \ 'green': { 'gui': '#c3e88d', 'cterm': '114', 'cterm16': '2' },
      \ 'yellow': { 'gui': '#ffe585', 'cterm': '180', 'cterm16': '3' },
      \ 'dark_yellow': { 'gui': '#ffcb6b', 'cterm': '173', 'cterm16': '11' },
      \ 'blue': { 'gui': '#82aaff', 'cterm': '39', 'cterm16': '4' },
      \ 'purple': { 'gui': '#c792ea', 'cterm': '170', 'cterm16': '5' },
      \ 'blue_purple': { 'gui': '#9cc4ff', 'cterm': '39', 'cterm16': '4'},
      \ 'cyan': { 'gui': '#89ddff', 'cterm': '38', 'cterm16': '6' },
      \ 'white': { 'gui': '#d0d0d0', 'cterm': '145', 'cterm16': '7' },
      \ 'black': { 'gui': '#292d3e', 'cterm': '235', 'cterm16': '0' },
      \}
colorscheme palenight

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

source ~/dotfiles/vim/coc.vim
