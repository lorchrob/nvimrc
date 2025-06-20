" Plugins
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' " OCaml LSP (view type/doc \k)
Plug 'nvim-lua/plenary.nvim'  
Plug 'nvim-telescope/telescope.nvim' " Find files and project-wide search (\p and \f)
Plug 'nvim-tree/nvim-web-devicons'  
Plug 'tpope/vim-fugitive' " Git stuff (diff viewer \d)

call plug#end()

" Basic settings
set background=dark
colorscheme gruvbox
syntax enable
filetype plugin indent on
set number
set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <silent> <leader>k :lua vim.lsp.buf.hover()<CR>

lua << EOF
require('telescope').setup{}
EOF

nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>d :Gdiffsplit<CR>

" Merlin 
if executable('opam')
  let g:opamshare=substitute(system('opam var share'),'\n$','','''')
  if isdirectory(g:opamshare."/merlin/vim")
    execute "set rtp+=" . g:opamshare."/merlin/vim"
  endif
endif

" OCaml LSP
lua << EOF
require'lspconfig'.ocamllsp.setup{}
EOF

lua << EOF
local cmp = require'cmp'
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})
EOF
