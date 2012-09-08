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
    let g:codepath = [$HOME."/code"]
endif

let loaded_codepath = 1

function! codepath#path(...)
  let current_dir = getcwd()

  let cp = ''
  for path in g:codepath

	  " if current dir is one of the code paths, use it
	  if current_dir == path
		  let cp = path
		  break

	  " else if current dir is IN one of the code paths, use that code path
	  elseif match(current_dir, path) >= 0
		  let cp = path.'/'.split(current_dir,'/')[len(split(path, "/"))]
		  break
	  endif

  endfor

  " otherwise, return the current dir OR 0 (if optional argument 1 is 0)
  if cp == ''
	let cp = a:0 > 0 && a:1 == 0 ? 0 : current_dir
  endif

  return cp

endfunction

function! codepath#cwd()
  let path = split(getcwd(), '/')
  call remove(path, -1)
  let g:codepath = ['/'.join(path,'/')]
  echom g:codepath
endfunction
