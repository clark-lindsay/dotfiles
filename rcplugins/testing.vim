Plug 'vim-test/vim-test'
Plug 'neomake/neomake'
Plug 'itchyny/lightline.vim'

let g:test#javascript#jest#options = "--reporters jest-vim-reporter"
let test#strategy = "neomake"
nnoremap <Leader>T :TestSuite<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <leader>tv :exec RunTestVerbose()<CR>

function! TestStatus() abort
  return g:testing_status
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'teststatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'teststatus': 'TestStatus'
      \ },
\ }

augroup neomake_hook
  au!
  autocmd User NeomakeJobFinished call TestFinished()
  autocmd User NeomakeJobStarted call TestStarted()
augroup END

let g:testing_status = ''

function! TestStarted() abort
  let g:testing_status = 'Test ⌛'
endfunction

function! TestFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:testing_status = 'Test ✅'
  endif
  if context.jobinfo.exit_code != 0
    let g:testing_status = 'Test ❌'
  endif
endfunction


function! RunTestVerbose()
  let g:test#javascript#jest#options = '' 
  :TestNearest -strategy=neovim 
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction
