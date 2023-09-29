#!/bin/bash

InstallVimPlug(){
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

ConfigVimPlug(){
  echo "set number

let g:coc_global_extensions = [
\ 'coc-sh',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-clangd',
\ 'coc-rust-analyzer',
\ 'coc-deno'
\ ]

\"function! InitializeCoc()
\"  call coc#util#install()
\"  call coc#util#install_extensions([
\"  \ 'coc-sh',
\"  \ 'coc-json',
\"  \ 'coc-tsserver',
\"  \ 'coc-eslint',
\"  \ 'coc-css',
\"  \ 'coc-yaml',
\"  \ 'coc-highlight',
\"  \ 'coc-clangd',
\"  \ 'coc-rust-analyzer',
\"  \ 'coc-deno'
\"  \ ])
\"endfunction

call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
Plug 'preservim/nerdtree'

call plug#end()

colorscheme retrobox
autocmd FileType scss setl iskeyword+=@-@



nnoremap <C-b> :NERDTreeToggle<CR>

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : '\<CR>'

\" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? '\<Tab>' :
      \ coc#refresh()

inoremap <silent><expr> <c-t> coc#refresh()
" > ${HOME}/.vimrc

  vim +'PlugInstall --sync' +qa
}


InstallVimPlug
ConfigVimPlug
