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

"	echo "It's not fucking bash"
"	Making paranthesis/brackets lazier
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {<cr><cr>}<up> 

inoremap /* /**/<left><left><cr>*<cr><up><right>
"	KATY QUESTIONS: Easier way to do left 3 times?
inoremap // /*  */<left><left><left>




"	Put parentheses around a visual selection [a'p]
"
"	KATY QUESTION: Making this generic so that [a'_] will do same thing
"	with _
xnoremap ð c()<left><esc>p

"	Visually select word in normal mode [a's][a'e]
"inoremap <a-s><a-e> viw

"Open / Close Tree File Exloprer
nnoremap <leader>t :NERDTree<CR>

