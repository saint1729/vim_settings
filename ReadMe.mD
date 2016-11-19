### About
This git repository has a collection of settings that I use for my vim editor.
You can find special macros enabed for latex and gams currently.

### Tex file documentation
* `<F9>`:			Saves the file. Saves the current view. Compiles the file using pdflatex. Any log is not printed on the terminal, rather goes into GARBAGE.txt.
* `:call Dtemp()`:	Deletes all temporary files belonging to current file, created as a result of pdflatex compilation.
* `:call Dtempall()`:	Deletes all temporary files belonging to all .tex files in the current directory.
* `:call Tex()`:		Gives a starting template for LaTeX documents. The initial template contents can be edited in plugins/TexTempl.tex.

### ~/.vimrc File contents

```VimL
:set mouse=a
:set nu
:set ruler
:set shiftwidth=4
:syntax enable

" Code folding settings
:set foldenable
:set foldmethod=indent

" Searching features
:set hlsearch
:set incsearch

" Always display filename
set laststatus=2

" To enable Folding in GAMS .lst file
:so ~/.vim/syntax/gamslist.vim

" Loading any special features for Latex
au FileType tex,plaintex so ~/.vim/plugins/latex.vim

" Loading any foldviewsettings
au BUFREAD * loadview

" Delete trailing space
function! Trail()
%s/\s\+$//g
endfunction
```
