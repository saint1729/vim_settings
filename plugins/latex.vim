" Operators in betwen
inoremap <buffer> qe<Tab> \quad&=\quad
inoremap <buffer> qle<Tab> \quad&\leq\quad
inoremap <buffer> qge<Tab> \quad&\geq\quad
inoremap <buffer> qd<Tab> \quad
inoremap <buffer> qqd<Tab> \qquad

" To compile and produce pdf output press, <F9>
:nmap <F9> :w<CR> :mkview<CR> :!pdflatex %>GARBAGE.txt<CR><CR> :!open %:r.pdf <cr><cr>

function! Dtemp()
!rm %:r.log %:r.bbl %:r.out %:r.*xmk %:r.blg %:r.fls
endfunction	


function! DtempAll()
!rm *.log *.bbl *.out *.*xmk *.blg *.fls
endfunction	

function! Tex()
0r ~/.vim/plugins/textempl.tex
let s:t = input( "Title? " )
execute "normal 32G0f{lcw".s:t."\<Esc>39G"
endfunction


"""""""""""""
" Variables "
"""""""""""""
setlocal timeoutlen=300


"""""""""""""
" Typefaces "
"""""""""""""
" Bold
imap <buffer> <C-C>b			\textbf{}<Left>
nmap <buffer> <C-C>b			wbi\textbf{<Esc>ea}<Esc>

" Italic
imap <buffer> <C-C>i			\textit{}<Left>
nmap <buffer> <C-C>i			wbi\textit{<Esc>ea}<Esc>

" Smallcaps
imap <buffer> <C-C>s			\textsc{}<Left>
nmap <buffer> <C-C>s			wbi\textsc{<Esc>ea}<Esc>

" Verbatim
imap <buffer> <C-C>v			\verb++<Left>
nmap <buffer> <C-C>v			wbi\verb+<Esc>ea+<Esc>
imap <buffer> V<Tab>			<CR>\begin{verbatim}<CR><CR>\end{verbatim}<UP>


" Underline
imap <buffer> _<Tab>			\underline{}<Left>
nmap <buffer> <C-C>_         wbi\underline{<Esc>ea}<Esc>



""""""""""""""""
" Enumerations "
""""""""""""""""
imap <buffer> I<Tab>			<CR>\begin{itemize}<CR><CR>\end{itemize}<UP><tab>
imap <buffer> E<Tab>			<CR>\begin{enumerate}<CR><CR>\end{enumerate}<UP><tab>
inoremap <buffer> i<Tab>		<Esc>$o\item{}<Left>



"""""""""""""
" Math mode "
"""""""""""""
imap <buffer> m<Tab>			$$<Left>
imap <buffer> M<Tab>			<CR>\begin{align}<CR><CR>\end{align}<UP><tab>


"""""""""""
" Tabular "
"""""""""""
imap <buffer> <C-C>T			<CR>\begin{tabular}{}<CR>\end{tabular}<UP><Esc>$i
imap <buffer> -<Tab>			\hline<CR>



""""""""""""
" Graphics "
""""""""""""
imap <buffer> *<Tab>			\includegraphics[width=cm]{}<Esc>F=a


"""""""""""""""""
" Double quotes "
"""""""""""""""""
imap <buffer> "				``''<Left><Left>
inoremap <buffer> \"			"
nmap <buffer> <C-C>"			wbi``<Esc>ea''<Esc>




"""""""""""""""""""
" New environment "
"""""""""""""""""""
imap <buffer> N<Tab>			<Esc>:call InsertEnv()<CR>

function! InsertEnv() 
	let s:t = input( "Environment? " )
	execute "normal o\\begin{".s:t."}\<CR>\<CR>\\end{".s:t."}\<UP>\<Esc>"
endfunction


""""""""
" Misc "
""""""""
vmap <buffer> %			:s/^/% <CR>:noh<CR>
imap <buffer> <Del><Tab>		<Esc>F{d%a{}<Left>


""""""""""""
" Movement "
""""""""""""

" In/out of braces
imap <buffer> }<Tab>		<Esc>f}a<space>
imap <buffer> {<Tab>		<Esc>F{bi

" In/out of environments
imap <buffer> ]<Tab>		<Esc>/\\end{.*}<cr>f}:noh<cr>a
map <buffer> ]				/\\end{.*}<cr>f}:noh<cr>

imap <buffer> [<Tab>		<Esc>?\\begin{.*}<cr>:noh<cr>i
map <buffer> [				?\\begin{.*}<cr>:noh<cr>

