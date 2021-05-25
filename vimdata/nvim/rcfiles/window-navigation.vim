nnoremap <C-n> <c-w>h
nnoremap <C-e> <c-w>j
nnoremap <C-i> <c-w>k
nnoremap <C-o> <c-w>l
if has('nvim')
	tnoremap <C-n> <c-\><c-n><c-w>h
	tnoremap <C-e> <c-\><c-n><c-w>j
	tnoremap <C-i> <c-\><c-n><c-w>k
	tnoremap <C-o> <c-\><c-n><c-w>l
endif

" Use `unimpaired`-style bracket mappings to navigate jump list
nnoremap [j <C-o>
nnoremap ]j <C-i>
