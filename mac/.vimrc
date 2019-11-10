set nocompatible              " be iMproved, required
filetype off                  " required

" plugin configurations
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe' " python auto-complete
Plugin 'junegunn/fzf.vim' " fuzzy finder
Plugin 'mileszs/ack.vim' " ack search
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'The-NERD-tree'
Plugin 'tpope/vim-surround' " autocomplete surroundings
Plugin 'heavenshell/vim-pydocstring'
Plugin 'scrooloose/syntastic' " flake8 required
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'shime/vim-livedown' " markdown preview
" Plugin 'morhetz/gruvbox'
call vundle#end()            " required
filetype plugin indent on    " required


set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set ruler " 현재 커서 위치 표시
set incsearch
set ic " ignore upper lower case search

" python indent setting
set tabstop=8
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set nocindent


if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

set encoding=utf-8
set fileencoding=utf-8

set splitright
set splitbelow

" colorscheme jellybeans
syntax enable
colorscheme monokai 
" let g:gruvbox_contrast_dark='hard'
" set background=dark
" colorscheme gruvbox
" set t_Co=256


" nerdtree
map <F3> :NERDTreeToggle<cr>
nmap <silent> <C-m> <Plug>(pydocstring)
" close vim if remaining window is only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" open nerdtree by default
autocmd vimenter * NERDTree
" jump to main window
autocmd VimEnter * wincmd p
" show hidden files
let NERDTreeShowHidden=1


" check blank space
set listchars=extends:⇒,precedes:⇐,tab:»·,trail:␣,eol:¬


" check python syntax, unsed import statementm, ...
let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" python syntax highlight (https://github.com/kh3phr3n/python-syntax)
syntax on " use python indent
let python_highlight_all = 1


" copy remote to local clipboard
" sudo apt-get install xclip
vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip
" mac
set clipboard=unnamed
" linux
" set clipboard=unnamedplus


" markdon preview
" launch/kill mapping
nmap <F8> :LivedownToggle<cr>
let g:livedown_port = 11000


" fzf
set rtp+=~/.fzf
" map :FZF to ctrl + p
nnoremap <silent> <C-p> :FZF -m<cr>
" hidden file search
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'


" ack silver search
" set runtimepath^=~/.vim/bundle/ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" split right as default
let g:ack_mappings = {
      \  'v': '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }


" set terminal as login shell environment
set shell=bash\ -l
" always open vim with terminal
" :terminal ++rows=10
" bind ctrl + t as open a terminal
map <C-t> :terminal ++rows=10 <enter>


" airline-theme
let g:airline_theme='dark'


" youcompleteme
" close window after leaving vim insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1
" close window after accepting offered keyword
let g:ycm_autoclose_preview_window_after_completion = 1
