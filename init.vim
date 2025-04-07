let mapleader = ";"

set encoding=utf-8
set fileencoding=utf-8

set shiftwidth=4                                                                
set expandtab
set nu
set relativenumber

" increamental search
set incsearch
set showmatch
set noswapfile
set scrolloff=8
set signcolumn=auto
set colorcolumn=120
set nowrap
" otherwise mouse highlight moves to view mode which is not good
set mouse=

" set guifont=DejaVu\ Sans\ Mono:h12
" set guifont=BlexMono\ Nerd\ Font:h14
" set guifontwide=Noto\ Sans\ Mono:h12
" set guifont=CodeNew\ Roman\ Nerd\ Font:h12
" set guifontwide=CodeNew\ Roman\ Nerd\ Font:h12


let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.config/nvim/init.nvim')
" obsidian
Plug 'epwalsh/obsidian.nvim'

" gruvbox
Plug 'ellisonleao/gruvbox.nvim'
Plug 'gruvbox-community/gruvbox'

Plug 'BurntSushi/ripgrep'

" Fuzzy search 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Harpoon
Plug 'ThePrimeagen/harpoon'

" a game to improve skillset with vim motion
Plug 'ThePrimeagen/vim-be-good'

" tree file system 
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

" Cleaner status line
Plug 'nvim-lualine/lualine.nvim'


" allows inline text enter and also enhances selection, eg. vim.ui.select
" becomes a harpoon like list 
Plug 'stevearc/dressing.nvim'

""""
" Lanugage server setup
Plug 'williamboman/mason.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For coding auto-complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""
" Copilot Chat
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

"""""
" Avante - Cursor
" Deps
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional deps
" Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
" Yay, pass source=true if you want to build from source
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

""""""""

" Toggle comment 
Plug 'numToStr/Comment.nvim'

" Highlight TODO
Plug 'folke/todo-comments.nvim'
"""""
" Debug business
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'ldelossa/nvim-dap-projects'
Plug 'mfussenegger/nvim-dap-python'

" Function and class Tree
Plug 'stevearc/aerial.nvim'

" For python proper syntax. nvim-treesitter gives more detailed syntax highlighting
Plug 'vim-python/python-syntax'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" highlight all occurences of a word
Plug 'RRethy/vim-illuminate'

" Floating terminal
Plug 'numToStr/FTerm.nvim'

" git
Plug 'NeogitOrg/neogit'
Plug 'sindrets/diffview.nvim'

" a nice plugin for cmd line
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none


""""" Telescope shortcuts
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files hidden=false<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>O <cmd>Telescope live_grep<cr>
nnoremap <leader>o :Telescope find_files<CR>

""" center the screen after moving up or down
noremap <C-u> <C-u>zz<CR>
noremap <C-d> <C-d>zz<CR>

""""" Harpoon
nnoremap <leader>m :lua require('harpoon.mark').add_file()<cr>
" nnoremap <leader>r :lua require('harpoon.mark').rm_file()<cr>
nnoremap <leader>h :lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>t :lua require('harpoon.term').gotoTerminal(1)<cr>
" tnoremap <Esc> <C-\><C-n>:lua require("harpoon.ui").toggle_quick_menu()<CR>
tnoremap <Esc> <C-\><C-n><CR>
nnoremap <leader>1 :lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <leader>2 :lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <leader>3 :lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <leader>4 :lua require('harpoon.ui').nav_file(4)<CR>
nnoremap <leader>5 :lua require('harpoon.ui').nav_file(5)<CR>
"""""""""
" Floating terminal
tnoremap <C-t> <C-\><C-n>:lua require("FTerm").toggle()<CR>
nnoremap <C-t> :lua require("FTerm").toggle()<CR>

" Control back slash to toggle comment
vmap <C-_> gc
nmap <C-_> gcc

noremap <Leader>y "+y                                                           
noremap <Leader>p "+p 

" vim tree 
noremap <Leader>d :NvimTreeToggle<CR> :AerialClose<CR>:CopilotChatClose<CR> 
" Copilot chat
noremap <Leader>c <Esc>:AerialClose<CR>:NvimTreeClose<CR>:CopilotChatToggle<CR>
noremap <c-s> <Esc>:AerialClose<CR>:NvimTreeClose<CR>:CopilotChatToggle<CR>
" Avante cursor
noremap <c-h> <Esc>:AerialClose<CR>:NvimTreeClose<CR>:lua require('avante').toggle()<CR>
inoremap <c-h> <Esc>:AerialClose<CR>:NvimTreeClose<CR>:lua require('avante').toggle()<CR>

" nonremap <C-o> :Telescope live_grep<CR>

"""""""""""""""""""""""""""""
" Window management shortcuts
"""""""""""""""""""""""""""""
noremap <Leader>w <c-w>w

" for terminal to go to normal mode
" tnoremap <c-n> <c-\><c-n>

" Enter Tab navigation mode
" noremap <silent> <Tab>h <c-w>h
" noremap <silent> <Tab>j <c-w>j
" noremap <silent> <Tab>k <c-w>k
" noremap <slent> <Tab>l <c-w>l

"""""""""""""""""
" Coding shortcuts
"""""""""""""""""       
" Code formatting with black (need pip install black)
" noremap <c-f> :FormatWithBlack<cr>


" function signature help
nnoremap <leader>f :NvimTreeClose<CR>:CopilotChatClose<CR>:AerialToggle<CR><c-w>w
" coding word occurance higlight with vim-illuminate
highlight IlluminatedWordText guibg=#3c3836 gui=NONE
highlight IlluminatedWordRead guibg=#3c3836 gui=NONE
highlight IlluminatedWordWrite guibg=#3c3836 gui=NONE

" Use Enter to confirm completion in coc.nvim
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
"""""""""""""""""
" LSP Business 
"""""""""""""""""
" Coc Commands
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>a <Plug>(coc-codeaction-cursor)
" nnoremap <leader>r <Plug>(coc-rename)
nmap <silent> gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nmap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nmap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <c-f> <cmd>lua vim.lsp.buf.format({ async = true })<CR>
nnoremap <leader>v <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
"""""""""""""""""
"""""""""""""""""
" Debug Business
"""""""""""""""""
nnoremap <Leader>g :lua require'dapui'.toggle()<CR>
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <F10> :lua require'dap'.step_over()<CR>
nnoremap <F11> :lua require'dap'.step_into()<CR>
nnoremap <F12> :lua require'dap'.step_out()<CR>
nnoremap <Leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <Leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <Leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <Leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <Leader>dl :lua require'dap'.run_last()<CR>

" Ensures that non of these shortcuts are overridden by other plugins
augroup custom_mappings
  autocmd!
  autocmd VimEnter * silent! nunmap <C-j>
  autocmd VimEnter * nnoremap <C-j> <C-i>
  autocmd VimEnter * nnoremap <C-k> <C-o>
  autocmd VimEnter * nnoremap <C-o> :Telescope find_files<CR>
  autocmd VimEnter * nnoremap <C-i> :Telescope live_grep<CR>
augroup END

" disable the annoying history edit 
nnoremap q: <Nop>


" to load lua configs
lua require('config')



