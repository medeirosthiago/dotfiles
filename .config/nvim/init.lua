vim.cmd('source $HOME/.config/nvim/allgemein/plugins.vim')
vim.cmd('source $HOME/.config/nvim/allgemein/settings.vim')
vim.cmd('source $HOME/.config/nvim/allgemein/mappings.vim')
vim.cmd('source $HOME/.config/nvim/allgemein/functions.vim')

require('plugins.lsp')
require('plugins.telescope')
require('plugins.compe')

require('telescope').load_extension('gh')

if pcall(require, 'localrc') then require('localrc').load() end
