Plug 'mileszs/ack.vim'

" Ack (with the Silver Searcher) for regex searches
" the ! bang keeps one from jumping to the first result immediately
nnoremap <Leader>a :Ack!
nnoremap <Leader>* :Ack! <C-R><C-W><CR>
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" fzf for file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

nnoremap <C-f> :<C-u>FZF<CR>
