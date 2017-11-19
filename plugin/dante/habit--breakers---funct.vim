"	My first function!
function! Fuck______you() abort


	let troll_text_base = 'MEOW BITCH MEOW'

	let repeat__X 	= 20
	let repeat__Y 	= 10

	let troll_text_base__padding = '    ' . troll_text_base
	let troll_text_buffer__line = repeat(troll_text_base__padding, repeat__X) 	."\n"
	let troll_text_buffer__row = repeat(troll_text_buffer__line, repeat__Y)

	put = troll_text_buffer__row
endfunction

function! Fuck___you___less() abort
	let text_base = 'You can not use that!'
	put = text_base
	
endfunction

nnoremap <End>		:call Fuck______you()<CR>
inoremap <End>		<Esc>:call Fuck______you()<CR>
xnoremap <End>		<Esc>:call Fuck______you()<CR>

nnoremap <Home>		:call Fuck______you()<CR>
inoremap <Home>		<Esc>:call Fuck______you()<CR>
xnoremap <Home>		<Esc>:call Fuck______you()<CR>

nnoremap <Backspace>	<Esc>:call Fuck___you___less()<CR>
inoremap <Backspace>	<Esc>:call Fuck___you___less()<CR>


"	echo "Katy: Bash isn't gonna happen";m;m
