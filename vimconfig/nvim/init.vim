" The leader needs to be set before any mappings that would use it
let mapleader = " "
set number 
set numberwidth=4
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set ignorecase 
set smartcase
set incsearch

" Tells nvim to treat all .svelte files as html
au! BufNewFile,BufRead *.svelte set ft=html


" Thanks to Chris Toomey (github.com/christoomey) for the elegant
" function and pattern for sourcing config files
function! s:SourceConfigFilesIn(directory)
  let directory_splat = stdpath('data') . '/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin(stdpath('data') . '/plugged')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()
call s:SourceConfigFilesIn('rcfiles')

" for extensions not written in typescript only:
" coc will check to install/ update these whenvere the service starts
let g:coc_global_extensions = ['coc-solargraph', 'coc-elixir']

if has('termguicolors')
  set termguicolors
endif
let g:sonokai_style = 'default'
colorscheme sonokai
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus','gitbranch', 'teststatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
			\   'gitbranch': 'FugitiveHead',
      \   'teststatus': 'TestStatus'
      \ },
\ }

" Handles the problem with both `coc.nvim` and tpope's `endwise` both remapping
" <CR> to handle completion
inoremap <silent> <CR> <C-r>=<SID>coc_confirm()<CR>
function! s:coc_confirm() abort
  if pumvisible()
    return coc#_select_confirm()
  else
    return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif
endfunction

nmap <leader>ch :noh<CR>
" The \ is needed to escape the pipe char
inoremap <c-p> <space>\|><space>
nmap Y y$
