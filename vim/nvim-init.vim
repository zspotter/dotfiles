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

  call dein#add('airblade/vim-gitgutter')

  " VSCode style autocomplete
  " After first time install, execute:
  "   :CocInstall coc-eslint coc-tsserver coc-tslint-plugin
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  "call dein#add('ianks/vim-tsx')
  "call dein#add('leafgarland/typescript-vim')

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

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

source ~/dotfiles/vim/coc.vim
