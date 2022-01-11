-- color
require('onenord').setup({
	fade_nc = false,
})


-- some hack because *gx* was not working properly on mac
local map = vim.api.nvim_set_keymap
map('', 'gx', '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', {})
