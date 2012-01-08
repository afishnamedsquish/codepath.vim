" ==================================================================
" File:        codepath.vim
" Description: This plugin provides a function to get a root project
"              directory based on a given directory.
"              It has other features, see
"              https://github.com/lucapette/codepath.vim.
"
" Maintainer:  Luca Pette <lucapette@gmail.com>
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

function! codepath#path()
  let current_dir = getcwd()
  if current_dir != g:codepath && match(current_dir, g:codepath) >= 0
    return g:codepath.'/'.split(current_dir,'/')[len(split(g:codepath, "/"))]
  else
    return current_dir
  endif
endfunction

function! codepath#cwd()
  let path = split(getcwd(), '/')
  call remove(path, -1)
  let g:codepath = '/'.join(path,'/')
endfunction
