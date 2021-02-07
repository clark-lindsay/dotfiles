Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lock-file', 'for': ['json']}
Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lock-file', 'for': ['javascript', 'typescript', 'jsx', 'tsx']}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lock-file', 'for': ['javascript', 'typescript', 'jsx', 'tsx']}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lock-file', 'for': ['javascript', 'typescript', 'jsx', 'tsx']}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lock-file', 'for': ['css', 'jsx', 'tsx']}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lock-file', 'for': ['html', 'jsx', 'tsx']}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lock-file'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lock-file'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lock-file', 'for': ['python']}

Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lock-file'}
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>P :Prettier<CR>
