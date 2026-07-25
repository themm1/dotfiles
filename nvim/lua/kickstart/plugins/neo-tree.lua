-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons')
end

vim.pack.add(plugins)

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer', silent = true })
vim.keymap.set('n', '<leader>o', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal current file', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    },
    window = {
      mappings = {
        ['<C-t>'] = 'open_tabnew',
        ['<C-x>'] = 'open_split',
        ['<C-v>'] = 'open_vsplit',
      },
    },
  },
  window = {
    position = 'left',
    width = 30,
  },
}
