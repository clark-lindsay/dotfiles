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

" for extensions not written in typescript only:
" coc will check to install/ update these whenvere the service starts
let g:coc_global_extensions = ['coc-solargraph', 'coc-elixir']

call s:SourceConfigFilesIn('rcfiles')

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
colorscheme sonokai

nmap <leader>ch :noh<CR>
" The \ is needed to escape the pipe char
inoremap <c-p> <space>\|><space>
nmap Y y$
