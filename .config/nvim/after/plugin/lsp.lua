local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'gopls',
  'jsonls',
  'dockerls',
  'pyright',
  'sqlls',
  'terraformls',
  'tsserver',
  'yamlls',
  'rust_analyzer',
})

local cmp = require('cmp')
local cmp_sources = {
  { name = 'nvim_lsp' },
  -- { name = 'nvim_lua' },
  { name = 'path' },
  { name = 'look' },
  { name = 'buffer', keyword_length = 5 },
}
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<CR>"] = cmp.mapping.confirm(cmp_select)
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings, sources = cmp_sources })

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- vim.keymap.set("n", "<C-]>", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "<C-]>", vim.cmd('vsplit | lua vim.lsp.buf.definition()'), { buffer=0 })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>lr", vim.cmd.LspRestart, opts)

  --[[ vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer=0 })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer=0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer=0 })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer=0 })
  vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer=0 }) ]]
end)

lsp.setup()
