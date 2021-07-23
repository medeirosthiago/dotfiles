vim.cmd('source $HOME/.config/nvim/dotvim/plugins.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/init.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/settings.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/mappings.vim')
vim.cmd('source $HOME/.config/nvim/dotvim/functions.vim')

require('plugins.lsp')
require('plugins.telescope')
require('plugins.compe')
require('plugins.treesitter')

require('trouble').setup {}
require('todo-comments').setup {}
require('lsp-colors').setup {}

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')

-- color
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd[[colorscheme tokyonight]]

-- if pcall(require, 'localrc') then require('localrc').load() end
