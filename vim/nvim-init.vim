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

  call dein#add('sudar/vim-arduino-syntax')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  call dein#add('airblade/vim-gitgutter')

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

colorscheme noctu
