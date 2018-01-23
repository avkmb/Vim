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
" *** avk: 
"     kind of - you would use an expression map... [:help :map-<expr>]
"            regular inoremap:               inoremap               <input keys>    <output keys / keys to press>
"         expression inoremap:               inoremap <expr>        <input keys>    <expression that returns string of output keys>
"     ... and then use repeat() [:help repeat()]
"        expression inoremap with repeat:    inoremap <expr>        <input keys>    repeat('<some output keys>', 3)
"        expression inoremap with repeat:    inoremap <expr>        <input keys>    '<an output key alone up here>' .repeat('<and then repeated output keys>', 3)


"	Easier way to make pretty comments, [C'/]
inoremap   /*  */<left><left><left>
" *** avk: this^ mapping rewritten with <expr> & repeat():
inoremap <expr>   '/*  */' .repeat('<left>',3)






"	Put parentheses around a visual selection [a'p]
"
"	KATY QUESTION: making this generic so that [a'_] will do same thing
"	with _
"	where _ is a generic character
xnoremap ð c()<left><esc>p

"	Visually select word in normal mode [a'q]
inoremap ñ <esc>viw


"Open / Close Tree File Exloprer
nnoremap <leader>t :NERDTree<CR>

