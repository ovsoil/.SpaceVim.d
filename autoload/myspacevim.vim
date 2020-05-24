function! IsLoad(pluginname)
  if &runtimepath =~ a:pluginname
    return 1
  else
    return 0
  endif
endfunction

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

" NERDTree============
let NERDTreeShowBookmarks=1         "allways show bookmarks
let NERDTreeChDirMode=2             "auto set pwd when open bookmarks
let NERDTreeIgnore=['node_modules', 'bower_components', '__pycache__', '\.pyc$', '\.pyo$', '\~$', '\.beam$']     "ignore files in NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" =====================

endfunction

function! myspacevim#after() abort
endfunction
