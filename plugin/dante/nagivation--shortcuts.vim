"	Navigation shortcuts 
let mapleader=";"

"	Switch between tabs easier using ;n
nnoremap <leader>, :tabn<CR>
nnoremap <leadeR>. :tabN<CR>

"	Switch between files easier using h|l
nnoremap <leader>h <C-W><C-H> 
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" 	Line Navigation - Move up and down while in insert mode with [a'j|k]
inoremap ê <Down>
inoremap ë <Up>

"	Line Navigation - Move to beginning of line [a'h]
nnoremap è ^
xnoremap è ^
cnoremap è <Home>


"	Line Navigation - Move to end of line [a'l]
nnoremap ì $
xnoremap ì $
cnoremap ì <End>

"	Line Navigation - Next Instance of Chars
nnoremap L ;
nnoremap H ,
xnoremap L ;
xnoremap H ,

" 	Resize VSP more easily:
"nnoremap <C-


" Highlighing searched word
inoremap ì <Esc>ea
inoremap è <Esc>bi

