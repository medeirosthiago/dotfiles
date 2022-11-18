local nmap = require("mdst.keymap").nmap
local nnoremap = require("mdst.keymap").nnoremap
local vmap = require("mdst.keymap").vmap

nnoremap("-", "<cmd>Ex<CR>")

nnoremap("<C-F>", "<cmd>FZF<CR>")
nmap("<leader>gs", ":Git<CR><C-w>30+")
-- nmap("<leader>fw", ":FixWhitespace<CR>")
nmap("<leader>no", ":nohlsearch<CR>")
nmap("<leader>B", ":set wrap linebreak tw=0<CR>")
nmap("<leader>BB", ":set nowrap linebreak tw=99<CR>")
nmap("<leader>os", ":Obsession<CR>")
nmap("<leader>od", ":Obsession!<CR>")
nmap("<leader>td", ":r!date<CR>")
-- nmap("<leader>pyc", ":!pycharm %<CR>")
nmap("<leader>bq", ":bp <BAR> bd #<CR>")
nmap("<leader>bd", ":bp <BAR> bw #<CR>")
nmap("<leader>bw", ":%bwipeout<CR>")
nmap("<leader>js", ":%!python -m json.tool<CR>")
vmap("<leader>ht", ":!tidy -q -i --show-errors 0<CR>")
nmap("<leader>cd", ":lcd %:h<CR>")
-- nmap("<leader>gl", ":e ~/notes/glossary.md<CR>")

-- some remaps hack
-- nnoremap Y y$
-- nnoremap n nzzzv
-- nnoremap N Nzzzv
-- nnoremap J mzJ`z

-- inoremap , ,<c-g>u
-- inoremap . .<c-g>u
-- inoremap ! !<c-g>u
-- inoremap ? ?<c-g>u

-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv
-- inoremap <C-k> <esc>:m .-2<CR>==
-- inoremap <C-j> <esc>:m .+1<CR>==
-- nnoremap <leader>k :m .-2<CR>==
-- nnoremap <leader>j :m .+1<CR>==

nmap("<leader>t2", ":set tabstop=2 shiftwidth=2<CR>")
nmap("<leader>t4", ":set tabstop=4 shiftwidth=4<CR>")

-- nmap <leader>L :set list!<CR>
-- set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

-- vnoremap < <gv
-- vnoremap > >gv


-- telescope
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>sg", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
nnoremap("<leader>lf", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
nnoremap("<leader>ld", "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<cr>")
nnoremap("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nnoremap("<leader>gc", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>")
nnoremap("<leader>ch", "<cmd>lua require('telescope.builtin').command_history()<cr>")
nnoremap("<leader>sh", "<cmd>lua require('telescope.builtin').search_history()<cr>")

-- nnoremap <leader>gp <cmd>lua require('telescope').extensions.gh.pull_request()<cr>

nnoremap("<leader>df", "<cmd>lua require('mdst.telescope').search_dotfiles()<cr>")
nnoremap("<leader>nt", "<cmd>lua require('mdst.telescope').search_notes()<cr>")
-- nnoremap("<leader>qr", "<cmd>lua require('mdst.telescope').search_query()<cr>")

nnoremap("<C-B>", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<C-/>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending', layout_config={prompt_position='top'}})<cr>")
nnoremap("<C-h>", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

nnoremap("<leader>kk", "<cmd>lua require('mdst.utils').heute()<cr>")
