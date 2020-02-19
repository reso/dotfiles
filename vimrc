call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'dbmrq/vim-ditto'
"Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kamwitsta/flatwhite-vim'
"Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-thematic'
Plug 'reedes/vim-wheel'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-textobj-sentence'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'vimwiki/vimwiki'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'andreypopp/vim-colors-plain'
Plug 'endel/vim-github-colorscheme'
Plug 'scrooloose/nerdtree'
"Plug 'gilgigilgil/anderson.vim'
Plug 'reso/anderson.vim'
"Plug 'AlessandroYorba/Alduin'
call plug#end()

syntax off 
filetype plugin indent on
set nocompatible
filetype plugin on

if has("win32")
	let $MYVIMRC='C:/dotfiles/vimrc'
else
	let $MYVIMRC='~/dotfiles/vimrc'
end

let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 3000

"call togglebg#map("<F5>")
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

noremap <silent> <F8> :<C-u>NextWordy<cr>
xnoremap <silent> <F8> :<C-u>NextWordy<cr>
inoremap <silent> <F8> <C-o>:NextWordy<cr>
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"set smartcase
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set noundofile
set viminfo=
set cm=blowfish2

set clipboard=unnamedplus,unnamed,autoselect  " use system paste buffer
set wrap
set laststatus=2
"set shellslash
set noeb vb t_vb=
"set t_vb=
" set vb=
"set novb
set t_ut=
set hlsearch
map <leader>c :nohl<CR>
noremap <silent> <C-l> :<C-u>nohlsearch<cr><C-l>
inoremap <silent> <C-l> <C-o>:nohlsearch<cr>

" ==============================
" Keyboard Binding Section 
"nnoremap ; :
let mapleader = "\<Space>"
let mapleader=","
"nnoremap <esc> :noh<return><esc>
"nnoremap s ace i<space><esc>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"imap jk <Esc>
"imap kj <Esc>  
"inoremap jk <Esc>
" hit both jk keys at the same time in any order to get out of insert mode  
inoremap jk <Esc>
inoremap jk <Esc>
"vnoremap kj <Esc>
"vnoremap jk <Esc>

noremap <Leader>w :w<CR>

nnoremap j gj
nnoremap k gk
nnoremap gb :buffers<CR>:b<Space>
nnoremap <Leader>q :bw<CR>

nmap <silent><buffer> <C-Down> <Plug>VimwikiDiaryNextDay
nmap <silent><buffer> <C-Up> <Plug>VimwikiDiaryPrevDay
" nnoremap <silent> <C-Up> VimwikiDiaryNextDay
" nnoremap <up> <nop>
" nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nmap <leader>di <Plug>ToggleDitto      " Turn it on and off
au FileType markdown,text,tex,vimwiki DittoOn  " Turn on Ditto's autocmds

" For most things set colors to 256, *except* win32 cmd.exe sessions
if has("win32") && !has("gui_win32")
else
	set t_Co=256
end

echom $bdir
if has('win32') || has('win64')
    if (v:version == 704 && has("patch393")) || v:version > 704
    	" echom "setting rendering option"
        "set renderoptions=type:directx,level:0.50,
        "    \gamma:1.0,contrast:0.0,geom:1,renmode:5,taamode:1
		set rop=type:directx,geom:1,taamode:1
		set enc=utf-8
		set mouse=a
	endif
endif

" ==============================
" Platform specific stuff
if has("gui_running")
  if has("gui_gtk3")
	  
	"set guioptions=
	set guioptions+=a
	set t_Co=256

	colorscheme anderson
	set guifont=DejaVu\ Sans\ Mono\ 9
  elseif has("gui_gtk2")
    "set guifont=Inconsolata\ 14

	set guioptions=

  elseif has("gui_macvim")
   " set guifont=Menlo\ Regular:h14
	set guifont=Monaco:h10
	"set guifont=Andale\ Mono:h13
	"set guifont=Courier\ New:h14
	"set antialias
	"set go+=T 
	"set transp=5	
  elseif has("gui_win32")
	" echom "gui_win32 called"
    " set guifont=Consolas:h10:cANSI
  "  set guifont=Cousine:h10
  "
  set guifont=Consolas:h10
	 behave mswin
	"let $MYVIMRC=$WINMYVIMRC
	set antialias
	"set guicursor+=a:blinkon1   " disable cursor blink
	set guioptions=
"	set guioptions-=T  "remove toolbar
"	set guioptions-=m  "remove menubar
"	set guioptions+=l  "remove menubar
"	set guioptions-=l  "remove menubar
"	set guioptions+=r  "remove menubar
"	set guioptions-=r  "remove menubar	
	
	if exists('g:guiwin32_loaded')
	else
		set columns=100 lines=70
		let g:guiwin32_loaded = 1
	endif
  endif
else
	if has("unix")
		"set mouse=a
		colorscheme anderson
	endif
endif

set background=dark

"colorscheme flatwhite
"set background=light
colorscheme anderson
"colorscheme badwolf
"colorscheme plain
"colorscheme github
"colorscheme flatcolor

"colo seoul256-light
"colorscheme PaperColor
"colorscheme gruvbox
"colorscheme solarized
"let g:lightline = { 'colorscheme': 'PaperColor' }
"let g:lightline = { 'colorscheme': 'solarized' }

"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul

" augroup reload_vimrc
"   " needed so ariline/lightline don't have problems when reloading vimrc
"    autocmd!
"     autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
" augroup END

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text        call pencil#init()
  autocmd FileType vimwiki      call pencil#init()
augroup END

augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
  autocmd FileType vimwiki call litecorrect#init()
augroup END

let g:thematic#themes = {
\ 'bubblegum'  : { 'typeface': 'Menlo',
\                  'font-size': 18,
\                  'transparency': 10,
\                  'linespace': 2,
\                },
\ 'pencil_dark' :{ 'colorscheme': 'pencil',
\                  'background': 'dark',
\                  'airline-theme': 'badwolf',
\                  'ruler': 1,
\                  'laststatus': 0,
\                  'typeface': 'Source Code Pro Light',
\                  'font-size': 20,
\                  'transparency': 10,
\                  'linespace': 8,
\                  'fullscreen': 1,
\                },
\ 'pencil_lite' :{ 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'airline-theme': 'light',
\                  'laststatus': 0,
\                  'ruler': 1,
\                  'typeface': 'Source Code Pro',
\                  'fullscreen': 1,
\                  'transparency': 0,
\                  'font-size': 20,
\                  'linespace': 6,
\                },
\ 'paper_lite' : { 'colorscheme' : 'PaperColor',
\                  'background': 'light',
\                  'airline-theme': 'PaperColor',
\                  'typeface': 'Cousine',
\                  'font-size':10,
\                  'linespace': 1,
\                  'transparency':90,
\                },
\ 'paper_big' : { 'colorscheme' : 'PaperColor',
\                  'background': 'light',
\                  'airline-theme': 'PaperColor',
\                  'typeface': 'Cousine',
\                  'font-size':16,
\                  'linespace': 2,
\                }
\ }

"augroup textobj_sentence
"  autocmd!
"  autocmd FileType markdown call textobj#sentence#init()
"  autocmd FileType textile call textobj#sentence#init()
"augroup END
"set mouse=c
"
"if has('statusline')
"
"  set laststatus=2
"  set statusline=%<%f
"  set statusline+=%w%h%m%r
"
"  set statusline+=\ %y
"  set statusline+=%=%-14.(%l,%c%V%)\ %p%%\
"
"
"endif
