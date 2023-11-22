local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>ha", ui.toggle_quick_menu)

vim.keymap.set("n", "'a", function() ui.nav_file(1) end)
vim.keymap.set("n", "'s", function() ui.nav_file(2) end)
vim.keymap.set("n", "'d", function() ui.nav_file(3) end)
vim.keymap.set("n", "'f", function() ui.nav_file(4) end)

require('harpoon').setup({
	menu = {
		width = 90
	}
})
