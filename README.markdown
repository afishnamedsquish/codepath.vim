codepath.vim is a plugin that provides a simple function to obtain your
code path directory if you have one.
The concept is simple: I have a dir located in $HOME/code where I store
all my projects and I want to set current project directory as root
directory for plug-in like NERDTree and CommandT.

How it works
------------

By default, codepath.vim does nothing. No, well it does something. It
adds a vim function codepath#path() that returns the your current code
dir. I can show how it works with some examples:

<table>
  <tr><td>File Opened</td><td>Result</td></tr>
  <tr><td>*codepath*/awesome-project/foo.rb</td><td>*codepath*/awesome-project</td></tr>
  <tr><td>*codepath*/code/super-project/foo/bar.rb</td><td>*codepath*/super-project</td></tr>
  <tr><td>/any/path/but/not/foo.rb</td><td>/any/path/but/not/</td></tr>
</table>

So, the codepath#path() Function returns the *project root* if you
open a file in any subdirectory of your codepath and returns the
directory itself if you open a file in any other location.

Installation
------------

Use the method you prefer: manual, bundle via pathogen and etc.

Configurations
--------------

At the moment codepath.vim provides the following variables:

-   g:codepath

    This must be set to your code path root. By default it points to
    $HOME/code.

NERDTree and CommandT
---------------------

You could use the codepath#path () in the following way:

    nnoremap <silent> <F4> :NERDTreeToggle `=codepath#path ()`<cr>
    inoremap <silent> <F4> <Esc>:NERDTreeToggle `=codepath#path()`<cr>

Every time I open a NERDTree window It opens itself based on my
function. The same thing with the CommandT plugin in the following way:

    map <silent> <C-T> :CommandT <c-r>=codepath#path()<CR><CR>
    imap <silent> <C-T> <ESC>:CommandT <c-r>=codepath#path()<CR><CR>

Obviously, you can choose different mappings and settings.

Copyright
---------

Copyright 2011 Luca Pette

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
“Software”), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
