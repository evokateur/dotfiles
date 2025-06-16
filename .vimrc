filetype plugin indent on
syntax on
set hlsearch
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.twig set filetype=html
autocmd BufRead,BufNewFile *.sh set filetype=zsh
autocmd BufRead,BufNewFile *.jinja set filetype=jinja

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

set splitright

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

set clipboard=unnamed

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

call pathogen#infect()

map <F2> :NERDTreeToggle<CR>
map <Space>e :NERDTreeToggle<CR>
map <F3> :noh<CR>
map <C-N><C-N> :set invnumber<CR>
map <C-W><C-W> ::%s/\s\+$//<CR>
