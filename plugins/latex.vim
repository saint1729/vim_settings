" Operators in betwen
inoremap qe \quad&=\quad
inoremap qle \quad&\leq\quad
inoremap qge \quad&\geq\quad
inoremap qd \quad
inoremap qqd \qquad


let @e='a\begin{align}^M^M\end{align}^[ka'
" To compile and produce pdf output press, <F9>
:nmap <F9> :w<CR> :!pdflatex %>GARBAGE.txt<CR>
