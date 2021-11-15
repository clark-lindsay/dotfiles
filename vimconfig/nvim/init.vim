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
set inccommand=split

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

" disables some default mappings from vim-polyglot
let g:scala_use_default_keymappings = 0

" Clear highlighting
nnoremap <leader>ch :noh<CR>
" The \ is needed to escape the pipe char
inoremap <c-p> <space>\|><space>
" Line up 'Y' with the other linewise commands
nnoremap Y y$
" Make a newline above and below the cursor
nnoremap <leader><CR> [<space>]<space>
" Easily hard quit all buffers
nnoremap <leader>Q :qa!<CR>
" Easily hard quit the current buffer
nnoremap <leader>q :q!<CR>
" Easily write and quit all buffers
nnoremap <leader>WQ :wqa<CR>
" Easily write and quit the current buffer
nnoremap <leader>wq :wq<CR>
" use qq to record into register 'q', and Q to replay it
nnoremap Q @q
" C*hange to D*irectory of C*urrent file
command CDC lcd %:p:h

" Call the setup function for hop.nvim
" I thought vim-plug would call this by default, but it is not atm...
:lua require'hop'.setup()

:lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

