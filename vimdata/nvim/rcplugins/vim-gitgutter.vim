Plug 'airblade/vim-gitgutter'

"using the 'h' as a mnemonic for hunk

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

"stage a hunk with <Leader>hs (for 'hunk stage')
"undor (rollback) a hunk with <Leader>hu (for 'hunk undo')

"the below mappings allow for using hunks as text objects
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
