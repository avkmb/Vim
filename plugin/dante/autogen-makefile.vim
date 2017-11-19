function! Makefile__file__extension___get()
	let filename='makefile'	
	
	let FILENAME	="FILENAME=" . expand('%:t')
	let FLAGS	="FLAGS=-std=c++11 -Wall -o"
	let EXENAME	="EXENAME=main"
	let CLASSOBJECT	="CLASSOBJECT=" . expand('%:t:r') . ".o"
	let CLASSCPP	= FILENAME
	let mainline	="main: $(CLASSOBJECT) $(FLAGS) $(EXENAME) $(CLASSOBJECT)"
	let response	="\tg++ $(FILENAME) $(FLAGS) $(EXENAME) $(CLASSOBJECT)"
	let objline	="$(CLASSOBJECT): $(CLASSHEADER) $(CLASSCPP)"
	let objresp	="\tg++ -c -std=c++11 -Wall $(CLASSCPP)"
	let clean	="clean:"
	let cleancmd 	= "\trm main"
	let filecontent = [FILENAME, FLAGS, EXENAME, CLASSOBJECT, CLASSCPP, mainline, response, objline, objresp, clean, cleancmd]

	call writefile(filecontent, filename)


endfunction

nnoremap <Down>	:call Makefile__file__extension___get()<CR>
