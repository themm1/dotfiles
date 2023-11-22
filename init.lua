local vimrc = vim.fn.stdpath("config") .. "/nvimrc.vim"
vim.cmd.source(vimrc)

require("onedarkpro").setup({
  colors = {
    orange = "#e06c75"
  }
})
vim.cmd("colorscheme onedark")

require('cinnamon').setup {
  extra_keymaps = true,
  extended_keymaps = true,
  override_keymaps = true,
  max_length = 500,
  scroll_limit = 100,
  always_scroll = false,
}

vim.keymap.set({ 'n', 'x' }, '<C-j>', "<Cmd>lua Scroll('10jzz', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<C-k>', "<Cmd>lua Scroll('10kzz', 0, 1)<CR>")

vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

