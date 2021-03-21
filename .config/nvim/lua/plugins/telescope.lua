require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        -- file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        -- grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        -- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        -- mappings = {
        --     i = {
        --         ["<C-x>"] = false,
        --         ["<C-q>"] = actions.send_to_qflist,
        --     },
        -- }
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
            "$HOME/.tmux/",
        },
    })
end

M.search_notes = function()
    require("telescope.builtin").find_files({
        prompt_title = "< notes >",
        cwd = "$HOME/notes/",
    })
end

M.search_custom = function(custom_path, title)
    require("telescope.builtin").find_files({
        prompt_title = "< " .. title .. " >",
        cwd = custom_path,
    })
end

return M
