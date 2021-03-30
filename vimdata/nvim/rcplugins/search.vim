Plug 'mhinz/vim-grepper'

nnoremap <leader>G :Grepper -tool ag<CR>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Search for the word under the cursor
" Meant to mirror the behavior of vim's `*` operator
nnoremap <leader>* :Grepper -tool ag -cword <CR>
" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1

" Ack (with the Silver Searcher) for regex searches
" the ! bang keeps one from jumping to the first result immediately

" fzf for file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

nnoremap <C-f> :<C-u>FZF<CR>
