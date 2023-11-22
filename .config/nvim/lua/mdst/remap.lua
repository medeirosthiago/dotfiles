

vim.keymap.set('n', '-', vim.cmd.Ex)
vim.keymap.set('n', '<C-f>', vim.cmd.FZF)
vim.keymap.set('n', '<leader>gs', ':Git<CR><C-w>30+', {})
vim.keymap.set('n', '<leader>no', ':nohlsearch<CR>', {})
vim.keymap.set('n', '<leader>os', ':Obsession<CR>', {})
vim.keymap.set('n', '<leader>od', ':Obsession!<CR>', {})
vim.keymap.set('n', '<leader>td', ':r!date<CR>', {})
vim.keymap.set('n', '<leader>bq', ':bp <BAR> bd #<CR>', {})
vim.keymap.set('n', '<leader>bd', ':bp <BAR> bw #<CR>', {})
vim.keymap.set('n', '<leader>bw', ':%bwipeout<CR>', {})
vim.keymap.set('n', '<leader>js', ':%!python -m json.tool<CR>', {})
vim.keymap.set('n', '<leader>cd', ':lcd %:h<CR>', {})

vim.keymap.set('n', '<leader>t2', ':set tabstop=2 shiftwidth=2<CR>', {noremap = false})
vim.keymap.set('n', '<leader>t4', ':set tabstop=4 shiftwidth=4<CR>', {noremap = false})

vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- inoremap , ,<c-g>u
-- inoremap . .<c-g>u
-- inoremap ! !<c-g>u
-- inoremap ? ?<c-g>u
