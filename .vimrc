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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/vim-easy-align'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

nmap <C-g> :vimgrep // **/*<left><left><left><left><left><left>
nmap <esc><esc> :noh<return>
nmap <C-f> :Files<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)

inoremap <C-c> <Esc>

"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
map <C-Right> :bnext<CR>
map <C-Left> :bprevious<CR>
map <C-b> :bdelete<CR>
map <C-h> :b#<CR>
map <C-q> :call QopenToggle()<CR>
map <C-s> :w<CR>
map <C-^> :bo term<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

" Use K to show documentation in preview window
" nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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

" for displaying thin vertical lines at each indentation level for code indented with spaces
let g:indentLine_defaultGroup = 'SpecialKey'

