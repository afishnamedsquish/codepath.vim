" ==================================================================
" File:        codepath.vim
" Description: Fork codepath by Luca Pette https://github.com/lucapette/codepath.vim.
"				Added ability for codepath#path to return 0 if otuside of the g:codepath.
" Maintainer:  Ben Glassman <bglassman@gmail.com>
" License:     Copyright 2012 Luca Pette
"              Distributed under the same terms as Vim itself.
" ==================================================================

if exists("loaded_codepath")
    finish
endif

if !exists("g:codepath")
    let g:codepath = $HOME."/code"
endif

let loaded_codepath = 1

function! codepath#path(...)
  let current_dir = getcwd()
  if current_dir != g:codepath && match(current_dir, g:codepath) >= 0
    return g:codepath.'/'.split(current_dir,'/')[len(split(g:codepath, "/"))]
  else
    return a:0 > 0 && a:1 == 1 ? 0 : current_dir
  endif
endfunction

function! codepath#cwd()
  let path = split(getcwd(), '/')
  call remove(path, -1)
  let g:codepath = '/'.join(path,'/')
  echom g:codepath
endfunction
