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


local noteplan_path = "/Library/Containers/co.noteplan.NotePlan-setapp/Data/Library/Application Support/co.noteplan.NotePlan-setapp"

local heute = function()

	local home = vim.api.nvim_exec('echo $HOME', true)
	local today = os.date("%Y%m%d")
	local today_filename = home .. noteplan_path .. '/Calendar/' .. today .. '.md'

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

local new_note = function()

	local home = vim.api.nvim_exec('echo $HOME', true)
	local new_note_filename = os.date("%Y%m%dT%H:%M:%S")
	local new_note_filepath = home .. noteplan_path .. '/Notes/' .. new_note_filename .. '.md'
  -- TODO: add `new_note_filename` as the header for the new file

	vim.api.nvim_exec('e ' .. new_note_filepath, false)

end


--[[ M.dataform_ref = function()

  local cmd = vim.api.nvim_command
  cmd("%s/\\${\\(ref\\|resolve\\)\\(\"\\(.[^-]*\\)\", \"\\(.[^-]*\\)\\)}\\(.[^-]*\\)/`\\2.\\3`")

  :'<,'>s/\${\(ref\|resolve\)("\(.\{-}\)", "\(.\{-}\)")}.\{-}/`\1.\2`/


end ]]


vim.keymap.set('n', '<leader>ht', heute, {})
vim.keymap.set('n', '<leader>nn', new_note, {})


--[[ local noteplan_path_calendar =  noteplan_path .. '/Calendar/'
local noteplan_path_notes =  noteplan_path .. '/Notes/'
local telescope_cmd = '<cmd>Telescope find_files path=' .. noteplan_path_calendar .. '<CR>' -- .. ' find_files path=' .. noteplan_path_notes

vim.keymap.set('n', '<leader>nl', telescope_cmd, {})
 ]]



-- Function to execute the desired DB command
vim.api.nvim_exec([[
  function! ExecuteDB()
    if mode() ==# 'v' || mode() ==# 'V' || mode() ==# "\<C-V>"
      :'<,'>DB bigquery://
    else
      :DB bigquery://
    endif
  endfunction
]], false)

-- Mapping for <leader>db
vim.api.nvim_set_keymap('n', '<leader>db', ':call ExecuteDB()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>db', ':call ExecuteDB()<CR>', { noremap = true, silent = true })
