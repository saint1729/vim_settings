" Operators in betwen
inoremap qe \quad&=\quad
inoremap qle \quad&\leq\quad
inoremap qge \quad&\geq\quad
inoremap qd \quad
inoremap qqd \qquad


let @e='a\begin{align}^M^M\end{align}^[ka'
" To compile and produce pdf output press, <F9>
:nmap <F9> :w<CR> :mkview<CR> :!pdflatex %>GARBAGE.txt<CR><CR>

function! Dtemp()
!rm %:r.log %:r.bbl %:r.out %:r.*xmk %:r.blg %:r.fls
endfunction	


function! DtempAll()
!rm *.log *.bbl *.out *.*xmk *.blg *.fls
endfunction	

function! Tex()
0r ~/.vim/plugins/textempl.tex
endfunction
