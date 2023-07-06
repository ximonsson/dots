setlocal tabstop=4
setlocal shiftwidth=4

augroup py
	aut!
	aut BufWritePre *.py %!black -
augroup END
