## About
This git repository has a collection of settings that I use for my vim editor.
The settings have some useful mappings for both insert mode and the normal mode. The `.vimrc` file given below is commented to show each functionality. The `<leader>` key is currently set to `,`.
You can find special macros enabed for latex and gams currently.

### General documentation
* `:call Trail()`:	Deletes trailing whitespaces at the end of lines.

### Tex file documentation
* `<F9>`:			Saves the file. Saves the current view. Compiles the file using pdflatex. Any log is not printed on the terminal, rather goes into GARBAGE.txt.
* `:call Dtemp()`:	Deletes all temporary files belonging to current file, created as a result of pdflatex compilation.
* `:call Dtempall()`:	Deletes all temporary files belonging to all .tex files in the current directory.
* `:call Tex()`:		Gives a starting template for LaTeX documents. The initial template contents can be edited in plugins/textempl.tex.
* Following shortcuts work in the insert mode and normal mode
	* `<C-C> b` : Text bold
	* `<C-C> i` : Text italic
	* `<C-C> s` : Text Small caps
* Following shortcuts work in the insert mode
	* `I<Tab>`      : Insert itemize
	* `E<Tab>`      : Insert enumerate
	* `M<Tab>`      : Insert align
	* `m<Tab>`      : Insert inline math
	* `<C-C>T`      : Insert tabular
	* `N<Tab>`      : Insert New Environment
    * `fig<Tab>`    : Insert figure 
    * `sfig<Tab>`   : Insert sub figure

### Gams Documentation
* `:call Gams()`:		Gives a starting template for gams documents. The initial template contents can be edited in plugins/gamstempl.tex.
* `P<Tab>`:		Positive
* `N<Tab>`:		Negative
* `V<Tab>`:		Variables
* `Pa<Tab>`:	Parameters
* `E<Tab>`:		Equations

### ~/.vimrc File contents
```VimL
:set nocompatible
:filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-latex/vim-latex'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
let g:tex_flavor='latex'






if has("gui_running")
    colo breeze
else
    colo Sriram
endif



:set mouse=a
:set nu
:set ruler
:set shiftwidth=4
:set tabstop=4
:set expandtab
:syntax enable

:let mapleader=","
:map <F10> :noh<CR>

" Code folding settings
":set foldenable
":set foldmethod=indent

" Searching features
:set hlsearch
:set incsearch

" Always display filename
set laststatus=2

" To enable Folding in GAMS .lst file
:so ~/.vim/syntax/gamslist.vim

" Loading any special features for Latex
au FileType tex,plaintex so ~/.vim/plugins/latex.vim
au FileType gams so ~/.vim/plugins/gams.vim

" Spell check for text files
" au FileType text setlocal spell

" Delete trailing space
function! Trail()
%s/\s\+$//g
endfunction 


" Convert tab to 4 spaces
function! Tab2Space()
%s/\t/    /g
endfunction

" Use jk in insert mode to go to normal mode
inoremap jk <esc>
"inoremap <esc> <nop>

"" Insert mode mappings for easy editing
inoremap <C-r> <Esc>pa
inoremap <leader>p <Esc>pa
inoremap <leader>D <Esc>Da
inoremap <leader>Y <Esc>yya
inoremap <leader>a <Esc>mzA
inoremap <leader>i <Esc>mzI

"" Insert mode motion
" Go visual one line up or down in insert mode: <leader>+j/k
inoremap <leader>j <Esc>gja
inoremap <leader>k <Esc>gka
" Move by w/b/e in insert mode: <leader>+w/b/e
inoremap <leader>w <Esc>lwi
inoremap <leader>b <Esc>lbi
inoremap <leader>e <Esc>ea
inoremap <leader>W <Esc>lWi
inoremap <leader>B <Esc>lBi
inoremap <leader>E <Esc>Ea
" Open new line above or below in the insert mode <leader>+o/O
inoremap <leader>o <Esc>mzo<Esc>`za
inoremap <leader>O <Esc>mzO<Esc>`za

"" Normal mode maps
" Open new line above or below in the normal mode WITHOUT exiting normal mode <leader>+o/O
nnoremap <leader>o mzo<Esc>`z
nnoremap <leader>O mzO<Esc>`z
```
