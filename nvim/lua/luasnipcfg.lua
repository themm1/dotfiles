local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})

vim.keymap.set({"s", "n"}, "<TAB>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"s", "n"}, "<S-TAB>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"s", "n"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
