"       =========================================
"	=          				=
"	=	Dante Pasionek's .vimrc		=
"	=					=
"	=========================================
"	This is a test line

"	AUTO-SOURCE 
if has("autocmd")

	augroup source_vimrc
		au!
		autocmd bufwritepost .vimrc source $MYVIMRC
	augroup END

endif

hi Normal ctermfg=252 ctermbg=NONE
set background=dark
hi Comment ctermbg=NONE ctermfg=Cyan
hi Visual cterm=bold,italic

set autoread
set gdefault
"	Set search hightlight colors
" 	Use :nohlsearch to turn off
hi hlsearch cterm=bold,italic,reverse ctermbg=darkgray
syntax on
"	.swp file directory

if has('unix')

	set backupdir=/tmp
	set directory=/tmp
endif

"	Attempted Workaround to the Alt key"
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endwhile

"Deprecated; Never use
"nnoremap ;s :saveas<space>
set ttimeoutlen=0

nnoremap  <a-m> :execute getline('.')<CR>
noremap  <Up>	:w<CR>:source <c-r>=expand("%:p")<CR><CR>

"	Used for an attempt at making indent look good
set ai
set smartindent
set cindent
"	So you don't have to scroll down
set scrolloff=25
set nocp
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone

"	Enable Folding
set foldenable
set foldmethod=marker
"
"	<space> to create open/close fold
nnoremap <space> za
 

"	[a'c] to create comment fold"{{{
xnoremap ã zf

"	[a'z] create a fold with added title
xnoremap ú <Esc>O [Fold Title]<cr> <Esc>gv<cr> zf<cr>

"	[a'x]
nnoremap ø zd "}}}


"	GVIM MODIFICATIONS

"	Remove that ugly toolbar up top
"	And everything else that's ugly
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=

