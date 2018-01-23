"	Remap escape to ;; for pinky mercy
let mapleader=";"
noremap <leader><leader> <Esc> 
inoremap <leader><leader> <Esc>:w<CR>
cnoremap <leader><leader> <Esc>


"	Accessing .vimrc easily
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>p :!xdg-open ~/.vim/plugin<CR><CR>
nmap <leader>sc :tabedit ~/.vim/plugin/dante/shortcuts.vim<CR>
nmap <leader>b :tabedit ~/.vim/plugin/dante/nagivation--shortcuts.vim<CR>
nmap <leader>o :tabedit ~/.vim/plugin/dante/

"	Remapping writing and quitting to ;w, ;wq, ;q
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z :wq!<CR>
nnoremap <leader>zz :q!<CR>
nnoremap <leader>wa :wqa<CR>

"	Making copying to system buffer easier [a'y]
vnoremap ù "+y

"	Deleting word to the left of the cursor
nnoremap <leader>d <left>viwd<delete>

"	Move cursor to top|bottom of window
nnoremap gH H
nnoremap gL L

"	Remap Backspace to Alt+D [a'd]
inoremap ä <Backspace>
cnoremap ä <Backspace>

"	Remap Delete to Alt+S [a's]
inoremap ó <Delete>

"	Showing menubar show command and last status
set laststatus=2
set showcmd

"	echo "It's not/ fucking bash"
"	Making paranthesis/brackets lazier
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {<cr><cr>}<up> 

"	Single bracket w/o entering [a'b]
inoremap â {}<left>

inoremap <leader>8  /**/<left><left><cr>*<cr><up><right>

"	KATY QUESTIONS: Easier way to do left 3 times?
"

"	Easier way to make pretty comments, [C'/]
inoremap   /*  */<left><left><left>





"	Put parentheses around a visual selection [a'p]
"
"	KATY QUESTION: making this generic so that [a'_] will do same thing
"	with _
"	where _ is a generic character
xnoremap ð c()<left><esc>p

" *** avk: 
"	1. problem:
"		1.0 we need to map an input char to a pair of related output chars 
"		1.1 there are two classes of pairs:
"			- doubled input char		e.g. '_'	---> '__'
"			- set of distinct chars		e.g. '(' or ')'	---> '()'
"		1.2 we want only one input char (following [a'P]) required to select a pair of either class
"		1.3 we don't want to manually map out all possibilities
"	2. solution:
"		there are a few ways we could do this,
"		but we will start with the most basic and revisit this later:
"			a function mapped to [a'P] that captures input to decide which pair to use

" NOTA BENE: use the help docs for anything unfamiliar you see in here!
function!	SurroundVisualSelection()	abort	" names of user functions unfortunately must start with capital letters

	" [1] capture the ascii code of a single key from the user,
	" |	then convert it into the literal character the key produces:
	let char = nr2char(getchar()) " by using getchar(), 
	" |				we never get an input timeout,
	" |				giving us time to try to remember 
	" |				what the hell we mapped for these

	" [2] define the keys that should map to non-doubled pairs:
	" |	[2.0] now, we could do something like this:
	let aliases = {}
	let aliases['(']	= '()'
	let aliases[')']	= '()'
	let aliases['<']	= '<>'
	let aliases['>']	= '<>'
	" |	|	and then this:
	if has_key(aliases, char)
		let pair = aliases[char]
	else
		let pair = repeat(char,2)
	endif
	" |	|	but that would mean defining a lot of aliases,
	" |	|	which we want to avoid
	" |	[2.1] so instead, 
	" |	|	we'll define our aliases like this:
	let aliases = [ '()', '<>', '{}', '[]', ]	" ... (+ any others)
	" |	|	... and use our friend filter() *
	" |	|	|	* /!\ WARNING ABOUT USING OUR FRIEND FILTER()!
	" |	|	|	*	vim 8 introduced lambda functions,
	" |	|	|	*	and without them filter(), map(), and many more
	" |	|	|	*	are tedious as fuck to use!
	" |	|	|	* GET VIM8!
	" |	|	we'll be using regex,
	" |	|	with '\v': very-magic mode, 
	" |	|	|	WHICH IS THE ONLY CIVILIZED MODE:
	" |	|	|	|	- almost all* single punctuation chars:
	" |	|	|	|		- either have special regex meaning
	" |	|	|	|		- OR can be escaped without gaining regex meaning
	" |	|	|	|			*(with the exception of _, which is always extra special when escaped)
	" |	|	|	|	- and all other chars:
	" |	|	|	|		- do NOT have special regex meaning
	" |	|	|	\v: intuitive and best.
	" |	|	|	so for simplicity, we'll escape all punctation chars but _,
	" |	|	|	even though only !@$%^&*()[]{}<>-+=|. have special regex meaning:
	let char_escaped = escape(char, '''!@#$%^&*()[]{}<>-+=\|.,;:')
	let regex_pattern = '\v' .char_escaped		" intuitive and best!
	" |	|	now, we use filter() to reduce the aliases list
	" |	|	to only pairs that contain our input char:
	" |	|	|	handle vim 7.x peasantry, as warned about above:
	if has('lambda')	" ===   delightful 8.x user
		let Check = { key, val -> val =~ regex_pattern }
		" ^ lambda functions unfortunately must start with capital letter
	else			" ===   diseased, immoral, republican 7.x user:
		let Check = ' v:val =~ '''.regex_pattern.''' '	" just look what you make us do
	endif
	" | 	|	|	then filter:
	call filter(aliases, Check)
	" |	|	if none of the aliases contained our char,
	" |	|	we will have an empty list,
	" |	|	and should default to doubling the char to make a pair:
	if empty(aliases)	" ===   char did not match any aliases
		let pair = repeat(char,2)
	else			" ===   char matched to at least one alias
		let pair = aliases[0]	" aliases is still a list, so take the first [0] item
	endif
	" |	... much cleaner!

	" [3] now, build the expression for the map:
	let output_keys = 'c'
	"	= cut the selection to the default register and enter insert mode
	let output_keys.= "\<c-r>\<c-r>=" 
	"	= open up the expression register to add our pair chars
	let output_keys.= string(pair[0]) . ' . @" . ' .string(pair[1])
	"	= <pair char #1 in quotes> . @" . <pair char #2 in quotes>
	let output_keys.= "\<cr>" 
	"	= insert the typed expression
	let output_keys.= "\<esc>" 
	"	= return to normal mode

	" [4] and return it!
	return output_keys
endfunction

" now define the map as the keys returned by our function:
xnoremap <buffer> <expr> ð	SurroundVisualSelection()

" TODO:
"	- create special aliases to frequently used pairs, e.g.
"		[a'P][a'J]	---> ()
"		[a'P][a'K]	---> {}
"		[a'P][a'L]	---> []
"		[a'P][a'O]	---> <>
"		...
"	- display a map of the special aliases when waiting for input after the user presses [a'P]
"	- ...???
" 



"	Visually select word in normal mode [a'q]
inoremap ñ <esc>viw


"Open / Close Tree File Exloprer
nnoremap <leader>t :NERDTree<CR>

