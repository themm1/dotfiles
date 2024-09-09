local cinnamon = require("cinnamon")

cinnamon.setup({
        keymaps = {
                extra = true,
                extended = true,
                override = true
        },
        options = {
                mode = false,
                max_delta = {
                        time = 502,
                        line = 100
                }
        }
})

vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)
vim.keymap.set("n", "<C-j>", function() cinnamon.scroll("10jzz") end)
vim.keymap.set("n", "<C-k>", function() cinnamon.scroll("10kzz") end)

