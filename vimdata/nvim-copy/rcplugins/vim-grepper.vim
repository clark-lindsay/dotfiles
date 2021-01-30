Plug 'mhinz/vim-grepper'

let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']
" The following command will search for the current word
nnoremap <Leader>* : Grepper -cword -noprompt<CR>
"This command will search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
function! SetupCommandAlias(input, output) 
	exec 'cabbrev <expr> '.a:input
		\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
		\ .'? ("'.a:output.'") : ("'.a:input.'"))' 
endfunction
call SetupCommandAlias("grep", "GrepperGrep")
nnoremap <Leader>G :Grepper -tool rg<CR>

