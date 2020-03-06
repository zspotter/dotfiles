source ~/.vimrc

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/zpotter/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/zpotter/.config/nvim/')
  call dein#begin('/Users/zpotter/.config/nvim/')

  " Let dein manage dein
  call dein#add('/Users/zpotter/.config/nvim/repos/github.com/Shougo/dein.vim')

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
