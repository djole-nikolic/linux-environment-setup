call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'morhetz/gruvbox'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}
  Plug 'vim-test/vim-test'
  Plug 'puremourning/vimspector'
call plug#end()

set termguicolors
set encoding=UTF-8
set background=dark
set nu
set nuw=1
set scrolloff=10
set ai
set si
set completeopt=menuone,noinsert,noselect
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamedplus

let mapleader = " "
let g:airline_powerline_fonts = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWinSize= 25
let g:WebDevIconsDefaultFolderSymbolColor = 'AFAFAF'
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Basic shortcuts 
nnoremap <silent> <leader>w <C-w>w
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>v <C-w>v<C-w>w
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>s :w<CR>
nnoremap <silent> <leader>a :wq<CR>
nnoremap <silent> <leader>o <C-o>
nnoremap <silent> <leader>x :bp\|bd #<CR>
nnoremap <silent> <leader>, :vertical resize -5<CR>
nnoremap <silent> <leader>. :vertical resize +5<CR>
nnoremap <silent> <leader>e :$<CR>
nnoremap <silent> <leader>r :0<CR>
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>


let test#strategy = "neovim"
nmap <silent> <leader>te :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>




" NerdTree shortcuts
nnoremap <silent> <leader>n :NERDTreeFind<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

" Searching shortcuts
nnoremap <silent> <leader>p <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>f <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>b <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>? <cmd>Telescope help_tags<cr>

" Git shortcuts
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gs :G<CR>


autocmd BufWritePre *.json %!jq --indent 4 .

lua require('lsp_config')

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

let g:vimspector_base_dir='/home/djole/.config/nvim/plugged/vimspector'
