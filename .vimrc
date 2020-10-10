" Don't try to be vi compatible
set nocompatible

call plug#begin('~/.vim/plugged')
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plug 'sjl/badwolf'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'itchyny/lightline.vim'

Plug 'tomtom/tcomment_vim'

Plug 'reedes/vim-colors-pencil'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'Valloric/YouCompleteMe'

Plug 'LucHermitte/lh-vim-lib'

Plug 'LucHermitte/lh-style'

Plug 'LucHermitte/lh-tags'

Plug 'LucHermitte/lh-dev'

Plug 'LucHermitte/lh-brackets'

Plug 'LucHermitte/searchInRuntime'

Plug 'LucHermitte/mu-template'

Plug 'tomtom/stakeholders_vim'

Plug 'LucHermitte/alternate-lite'

Plug 'LucHermitte/lh-cpp'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'vim-scripts/indentpython.vim'

Plug 'jupyter-vim/jupyter-vim'

Plug 'lervag/vimtex'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'neomake/neomake'

Plug 'zyedidia/julialint.vim'

"Plugin 'scrooloose/syntastic'

" Initialize plugin system
call plug#end()
" All of your Plugins must be added before the following line
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 
" Turn on syntax highlighting
syntax on

colorscheme badwolf

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

"No templates when new file is created"
let g:mt_IDontWantTemplatesAutomaticallyInserted = 1

"Hopfully closes YouCompleteMe window after completion
let g:ycm_autoclose_preview_window_after_insertion = 1

"Hopfully no config question on start up"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw
set <M-1>=^[1
" If fuzzy finder installed using git
set rtp+=~/.fzf

"Set relative numbers
set number relativenumber

"Custom key-maps"
map <F2> :YcmCompleter FixIt<CR>

map <F3> :%!astyle<CR>

"map <F4> :FZF ~<CR>

"map <F5> :FZF <CR>

"map <M-1> :b 1 <CR>

map <F12> :JupyterConnect<CR>

map <F11> :JupyterCd %:p:h<CR>

map <F6> :JupyterRunFile<CR>

map <F5> :JupyterSendCell<CR>

map <F8> :PythonSetBreak<CR>

"Timeout
set timeoutlen=1000
set ttimeoutlen=5

au BufNewFile,BufRead *.py set encoding=utf-8
au BufNewFile,BufRead *.py set tabstop=4

"Vim-TeX settings
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
"No python line splits
set formatoptions-=tc

"Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_python_filetype_checkers = ['<checker-name>']
"let g:syntastic_python_checkers = ['pylint']

"Neomake for Julia-linting
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

let g:latex_to_unicode_auto = 1

