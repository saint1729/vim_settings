if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au BufNewFile,BufRead *.gms	 setf gams
augroup END
