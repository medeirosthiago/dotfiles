-- local actions = require('telescope.actions')

-- local git_move_branch = function(prompt_bufnr)
--   local cwd = action_state.get_current_picker(.prompt_bufnr).cwd
--   local selection = action_state.get_selected_entry()

--   local confirmation = vim.fn.input('Do you really wanna delete branch ' .. selection.value .. '? [Y/n] ')
--   if confirmation ~= '' and string.lower(confirmation) ~= 'y' then return end

--   actions.close(prompt_bufnr)
--   local _, ret, stderr = utils.get_os_command_output({ 'git', 'branch', '-D', selection.value }, cwd)
--   if ret == 0 then
--     print("Deleted branch: " .. selection.value)
--   else
--     print(string.format(
--       'Error when deleting branch: %s. Git returned: "%s"',
--       selection.value,
--       table.concat(stderr, '  ')
--     ))
--   end
-- end


require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        path_display = {truncate = 3},
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< .dotfiles >",
        search_dirs = {
            "$HOME/.config/nvim",
            "$HOME/.config/alacritty",
            "$HOME/.config/karabiner",
        },
    })
end


M.search_notes = function()
    require("telescope.builtin").find_files({
        prompt_title = "< notes >",
        search_dirs = {
            "$HOME/notes/",
        },
    })
end

M.search_custom = function(custom_path, title)
    require("telescope.builtin").find_files({
        prompt_title = "< " .. title .. " >",
        cwd = custom_path,
    })
end

return M
