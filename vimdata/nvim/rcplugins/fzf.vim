Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

nnoremap <C-f> :<C-u>FZF<CR>
