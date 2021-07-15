vim.cmd('source $HOME/.config/nvim/allgemein/plugins.vim')
vim.cmd('source $HOME/.config/nvim/allgemein/settings.vim')
vim.cmd('source $HOME/.config/nvim/allgemein/mappings.vim')
vim.cmd('source $HOME/.config/nvim/allgemein/functions.vim')

require('plugins.lsp')
require('plugins.telescope')
require('plugins.compe')
require('plugins.treesitter')

require('trouble').setup {}
require('todo-comments').setup {}
require('lsp-colors').setup {}
-- require('neoscroll').setup()

-- color
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd[[colorscheme tokyonight]]

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')

-- if pcall(require, 'localrc') then require('localrc').load() end
