setlocal tabstop=4
setlocal shiftwidth=4

function PyLint()
	silent execute 'w !black -q --check -'
	if v:shell_error == 123
		return
	endif

	" save the view
	let curw = winsaveview()
	" format
	%!black -q -
	" restore view
	call winrestview(curw)
endfunction

augroup py
	au!
	"aut BufWritePre python %!black -q -
	au BufWritePre *.py call PyLint()
augroup END
