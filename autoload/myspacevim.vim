function! myspacevim#before() abort

set scrolloff=7                 " when scrolling, 7 lines away from screen border

let g:neomake_enabled_c_makers = ['clang']
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
let g:neomake_open_list = 0

let g:spacevim_default_indent = 4
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


" Replace the selected text which is path of an image with URL in QiuNiu Cloudu
" Upload the image to QiuNiu Cloud
function! ReplaceWithQiuniuURL()
  " yank current visual selection to reg x
  normal gv"xy
  " get basename of the image
  let basename = fnamemodify(@x, ":t")
  " upload image to 'blog' bucket of qiniu cloud
  exe printf("!qshell fput blog %s %s", basename, @x)
  " put new string value in reg x
  let @x = printf("![Alt](http://cdn.ovsoil.cn/%s)", basename)
  " re-select area and delete
  normal gvd
  " paste new string value back in
  normal "xp
endfunction
vnoremap <Space>ii :call ReplaceWithQiuniuURL()<cr>

endfunction

function! myspacevim#after() abort
endfunction
