"----- Search for symbols or patterns across files -----

Plug 'mhinz/vim-grepper'

nnoremap <leader>G :Grepper -tool ag -grepprg ag --path-to-ignore ~/.ignore<CR>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Search for the word under the cursor
" Meant to mirror the behavior of vim's `*` operator
nnoremap <leader>* :Grepper -tool ag -cword <CR>
" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 0
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1

" Ack (with the Silver Searcher) for regex searches
" the ! bang keeps one from jumping to the first result immediately

"--- End Search for symbols or patterns across files ---

"----- Finding a single file, directory, or command -----

" fzf for file searching
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Open f*zf to find files
nnoremap <C-f> :<C-u>FZF<CR>
" Use fzf's `Commands` command to find a co*mmand
" using `co` since it is a good roll on colemak & I use `ch` to c*lear
" h*ighlighting
nmap <leader>co :Commands<CR>
xmap <leader>co :Commands<CR>

"--- End Finding a single file, directory, or command ---

"----- Explore the file tree -----

" NERDTree for file explorer and file system operations
Plug 'preservim/nerdtree'
" adds git status flags to the file tree
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"--- End Explore the file tree ---
