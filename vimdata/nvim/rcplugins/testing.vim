Plug 'vim-test/vim-test'
Plug 'neomake/neomake'
Plug 'itchyny/lightline.vim'

let g:test#javascript#jest#options = '--reporters jest-vim-reporter --detectOpenHandles --watch-all=false'
let g:test#javascript#reactscripts#options = '--reporters jest-vim-reporter --watch-all=false'
let test#strategy = "neomake"

nnoremap <Leader>T :TestSuite<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <leader>tfv :exec RunTestFileVerbose()<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <leader>tnv :exec RunTestNearestVerbose()<CR>

function! TestStatus() abort
  return g:testing_status
endfunction

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

function! RunTestNearestVerbose()
	let g:test#javascript#jest#options = "--detectOpenHandles"
  let g:test#javascript#reactscripts#options = '--watch-all=false'
  :TestNearest -strategy=neovim 
  let g:test#javascript#jest#options = "--reporters jest-vim-reporter --detectOpenHandles --watch-all=false"
  let g:test#javascript#reactscripts#options = '--reporters jest-vim-reporter --watch-all=false'
endfunction

function! RunTestFileVerbose()
  let g:test#javascript#jest#options = "--detectOpenHandles"
  let g:test#javascript#reactscripts#options = '--watch-all=false'
  :TestFile -strategy=neovim 
  let g:test#javascript#jest#options = "--reporters jest-vim-reporter --detectOpenHandles --watch-all=false"
  let g:test#javascript#reactscripts#options = '--reporters jest-vim-reporter --watch-all=false'
endfunction

