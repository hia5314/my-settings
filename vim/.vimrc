" =============================================================================
" Vim Configuration — my-settings/vim/.vimrc
" ~/.vimrc 심볼릭 링크로 관리 (터미널 빠른 편집용 — 메인 에디터는 neovim)
" =============================================================================

" => General
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set history=1000
set autoread
set hidden

" => UI
set number
set relativenumber      " 현재 줄 기준 상대 번호 (5j/3k 같은 이동에 편리 — 불편하면 이 줄 삭제)
set cursorline
set showcmd
set showmode
set wildmenu
set wildmode=list:longest
set laststatus=2
set scrolloff=8
set signcolumn=yes

" => Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" => Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" => Colors
syntax enable
set termguicolors
set background=dark

" Dracula Pro 테마 (상용 — ~/.vim/pack에 수동 설치, 없으면 조용히 스킵)
silent! packadd! dracula_pro
silent! colorscheme dracula_pro

" => Keybindings
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" => Backup — 백업/스왑 파일은 끄고, 대신 undo 이력을 파일로 영속화
"    (파일 닫았다 열어도 u로 되돌리기 가능. ~/.vim/undodir는 bootstrap이 생성)
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

" => Mouse
set mouse=a
