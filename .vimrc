syntax on
set statusline=%f
set hidden
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set number
set ignorecase
set smartcase
set noswapfile
set cursorline
set ttimeoutlen=0
" terminal width
set termwinsize=10x0 
filetype plugin indent on
let @a = 0

function QopenToggle()
  if @a == 1 
    cclose 
    let @a = 0
  else 
    copen
    let @a = 1
  endif
endfunction

call plug#begin()
  Plug 'junegunn/vim-easy-align'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'preservim/nerdtree'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Valloric/YouCompleteMe'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

inoremap <C-c> <Esc>
nmap <C-g> :vimgrep // **/*<left><left><left><left><left><left>
nmap <esc><esc> :noh<return>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

map <C-Right> :bnext<CR>
map <C-Left> :bprevious<CR>
map <C-b> :bdelete<CR>
map <C-h> :b#<CR>

map <C-f> :LspDocumentRangeFormat<CR>
map <C-q> :call QopenToggle()<CR>
map <C-s> :w<CR>
map <C-e> :LspDeclaration<CR>
map <C-^> :bo term<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

colorscheme catppuccin-mocha
let g:lsp_diagnostics_enabled = 0 
let g:lsp_document_highlight_enabled = 1
let g:auto_save = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='atomic'
" c syntax for header files
let g:c_syntax_for_h = 1
" line highliting
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white

xmap ga <Plug>(EasyAlign)
