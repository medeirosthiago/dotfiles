local lspkind = require'lspkind'

lspkind.init({
  preset = 'codicons',
})


local cmp = require'cmp'

cmp.setup({

  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-2), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(2), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  formatting = {
    format = function(entry, vim_item)

      vim_item.kind = lspkind.presets.default[vim_item.kind]

      vim_item.menu = ({
        nvim_lua = "[LUA]",
        nvim_lsp = "[LSP]",
        look = "[Dict]",
        path = "[Path]",
        buffer = "[Buffer]",
      })[entry.source.name]

      return vim_item
    end
  },

  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'look' },
    { name = 'buffer', keyword_length = 5 },
  }

})
