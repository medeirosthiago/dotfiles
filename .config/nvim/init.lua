vim.cmd('source $HOME/.config/nvim/dotvim/plugins.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/init.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/settings.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/mappings.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/functions.vim')

require('plugins.lsp')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lualine')
-- require('plugins.harpoon')
require('plugins.completion')
require('plugins.misc')

require('trouble').setup {}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('gh')
-- require('todo-comments').setup {}
require('lsp-colors').setup {}

-- if pcall(require, 'localrc') then require('localrc').load() end
--
vim.opt.laststatus = 3
