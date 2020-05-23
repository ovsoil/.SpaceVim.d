function! myspacevim#before() abort
let g:neomake_enabled_c_makers = ['clang']
let g:NERDToggleCheckAllLines = 1

call SpaceVim#custom#SPC('nmap', ['c', 'c'], '<Plug>NERDCommenterComment', 'comment-lines', 0)
call SpaceVim#custom#SPC('nmap', ['c', '<Space>'], '<Plug>NERDCommenterToggle', 'comment-lines', 0)

" call SpaceVim#custom#SPCGroupName(['y'], '+copy-paste')
" call SpaceVim#custom#SPC('nmap', ['y', 'y'], '"+y', 'copy-to-clipboard', 0)
" call SpaceVim#custom#SPC('nmap', ['y', 'y'], '"+y', 'copy-to-clipboard', 0)
" call SpaceVim#custom#SPC('vmap', ['p', 'p'], '"+p', 'paste-from-clipboard', 0)
" call SpaceVim#custom#SPC('vmap', ['p', 'p'], '"+p', 'paste-from-clipboard', 0)

nmap <Space>dd "+d
vmap <Space>dd "+d
nmap <Space>yy "+y
vmap <Space>yy "+y
nmap <Space>pp "+p
vmap <Space>pp "+p
nmap <Space>pP "+P
vmap <Space>pP "+P

endfunction

function! myspacevim#after() abort
endfunction
