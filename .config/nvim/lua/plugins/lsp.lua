
local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dc', '<Cmd>lua vim.lsp.diagnostic.clear(vim.api.nvim_get_current_buf())<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ds', '<Cmd>lua vim.cmd("e %")<CR>', opts)
end



------
-- Configurations:


----
-- bash: npm i -g bash-language-server
nvim_lsp['bashls'].setup{
  on_attach = on_attach
}


----
-- json: npm install -g vscode-json-languageserver
nvim_lsp['jsonls'].setup{
  on_attach = on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}


----
-- docker: npm install -g dockerfile-language-server-nodejs
nvim_lsp['dockerls'].setup{
  on_attach = on_attach
}


----
-- lua: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
HOME = vim.fn.expand('$HOME')

local sumneko_root_path = ""
local sumneko_binary = ""

sumneko_root_path = HOME ..  "/src/clones/lua-language-server"
sumneko_binary = HOME ..  "/src/clones/lua-language-server/bin/macOS/lua-language-server"

nvim_lsp['sumneko_lua'].setup{
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  }
}


----
-- python: https://github.com/palantir/python-language-server
nvim_lsp['pyls'].setup{
  on_attach = on_attach,
  settings = {
    pyls = {
      -- configurationSources = {"pycodestyle", "flake8"},
      plugins = {
        yapf = {enabled = true},
        pylint = {enabled = false},
        pycodestyle = {enabled = false},
        pyflakes = {enabled = false},
        pydocstyle = {enabled = false},
        flake8 = {enabled = true}
      }
    }
  }
}


----
-- terraform: https://github.com/hashicorp/terraform-ls
nvim_lsp['terraformls'].setup{
  cmd = { "terraform-lsp", "serve" },
  filetypes = { "terraform" },
  on_attach = on_attach
}


----
-- vim: npm install -g vim-language-server
nvim_lsp['vimls'].setup{
  on_attach = on_attach
}


----
-- yaml: npm install -g yaml-language-server
nvim_lsp['yamlls'].setup{
  on_attach = on_attach
}
