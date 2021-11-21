vim.cmd('source $HOME/.config/nvim/dotvim/plugins.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/init.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/settings.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/mappings.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/functions.vim')

require('plugins.lsp')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.harpoon')
require('plugins.completion')

require('trouble').setup {}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('gh')
-- require('todo-comments').setup {}
require('lsp-colors').setup {}
require('gitsigns').setup()

-- color
-- require('nord').set()
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme default]]
-- vim.cmd[[colorscheme nord]]
vim.cmd[[colorscheme onenord]]

-- if pcall(require, 'localrc') then require('localrc').load() end

-- some hack because *gx* was not working properly on mac
local map = vim.api.nvim_set_keymap
map('', 'gx', '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', {})
