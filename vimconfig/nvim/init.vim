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

let g:onedark_color_overrides = {
\ "black": {"gui": "1718FC", "cterm": "233", "cterm16": "0" },
\}
colorscheme onedark
set background=dark

nmap <leader>ch :noh<CR>
