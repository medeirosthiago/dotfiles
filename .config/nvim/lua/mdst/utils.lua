local highlight_augroup = vim.api.nvim_create_augroup('highlight_yank', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = highlight_augroup,
  callback = function()
	  vim.highlight.on_yank({ timeout = 60 })
  end
})


local dataform_sqlx_augroup = vim.api.nvim_create_augroup('dataform_sqlx_syntax', {clear = true })

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*.sqlx',
  group = dataform_sqlx_augroup,
  command = "set syntax=sql"
})






--[[

* Check if today's file exists inside notes path - OK
* If doens't exist: create one - OK
* If exists open file - OK
* Add to keybind
* For yesterday and tomorrow add params and conditions

--]]


local M = {}

M.heute = function()

	local home = vim.api.nvim_exec('echo $HOME', true)
	local today = os.date("%Y%m%d")
	local today_filename = home .. '/notes/' .. today .. '.md'

	-- Maybe this functions and condition are not needed since nvim will
	-- open file anyway.
	--[[ local function file_exists(name)
	   local f=io.open(name,"r")
	   if f~=nil then io.close(f) return true else return false end
	end

	if not file_exists(today_filename) then
		vim.api.nvim_exec('!touch ' .. today_filename, false)
		vim.api.nvim_exec('e ' .. today_filename, false)
	end ]]

	vim.api.nvim_exec('e ' .. today_filename, false)

end

return M
