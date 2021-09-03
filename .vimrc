set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/seoul256.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/vim-colors-pencil'
Plug 'romgrk/github-light.vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'mattn/webapi-vim'
call plug#end()

set path+=**
set wildmenu
set complete-=i

" Display as much as possible instead of @
set display+=lastline
" Copy and paste outside of Vim 
:inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "+y
:vnoremap <C-d> "+d

" Commenting blocks of code
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,rust  let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> <C-_> :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <C-k> :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


let mapleader = " "

" NerdTree mappings
noremap <Bslash> :NERDTree <CR>
noremap <Bslash> :NERDTreeToggle <CR>
noremap <leader>n :NERDTreeFocus<CR>
noremap <C-f> :NERDTreeFind<CR>

" Run python files by hitting F5
map <F5> <Esc>:w<CR>:!python3 %<CR>

" Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
set conceallevel=2

" Enable Russian typing in English layout
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Enable spellchecking
setlocal spell spelllang=ru_yo,en_us

" Remap emmet leader key
let g:user_emmet_leader_key='`'
" Enable emmet just for html/css
let g:user_emmet_install_global = 0
" Enable custom snippets
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

autocmd FileType html,css EmmetInstall

set autoindent
syntax on

"set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
"set mouse=a "Включить поддержку мыши
set termencoding=utf-8
"set novisualbell "Не мигать

" Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Вырубаем черточки на табах
set showtabline=1

" Переносим на другую строчку, разрываем строки
set wrap
set linebreak

" Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251

set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

" Pencil colorscheme
set background=dark
let g:pencil_terminal_italics = 1

colo pencil
