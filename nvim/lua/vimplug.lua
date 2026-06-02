local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Better file tree
-- Plug('preservim/nerdtree')
Plug("nvim-tree/nvim-tree.lua")

-- Theme
Plug('olimorris/onedarkpro.nvim')

-- Smooth scrolling
Plug('declancm/cinnamon.nvim')

-- Syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-lua/plenary.nvim')

-- Fuzzy finder
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

-- LSP and autocompletion
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

-- Icons
Plug('nvim-tree/nvim-web-devicons')

-- Comment toggle
Plug('numToStr/Comment.nvim')

Plug('NeogitOrg/neogit')

-- Live previews of latex, md...
Plug('frabjous/knap')


vim.call('plug#end')
