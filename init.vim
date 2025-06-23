" Plugins
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'nvim-lua/plenary.nvim'  
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'  
Plug 'tpope/vim-fugitive'

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

" Key mappings
nnoremap <silent> <leader>k :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>d :Gdiffsplit<CR>

" LSP, CMP, Telescope setup
lua << EOF
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- OCaml LSP setup
lspconfig.ocamllsp.setup {
  cmd = { "ocamllsp" },
  capabilities = capabilities,
}

-- Completion config
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

-- Telescope
require('telescope').setup{}
EOF
