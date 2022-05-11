local nvim_lsp = require('lspconfig')
local on_attach = function()
  -- local opts = { noremap=true, silent=true }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer=0 })
  vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, { buffer=0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { buffer=0 })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer=0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer=0 })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer=0 })
  vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer=0 })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer=0 })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer=0 })
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dc', '<Cmd>lua vim.lsp.diagnostic.clear(vim.api.nvim_get_current_buf())<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ds', '<Cmd>lua vim.cmd("e %")<CR>', opts)
end



------
-- Configurations:


----
-- bash: npm i -g bash-language-server
nvim_lsp['bashls'].setup{
  on_attach = on_attach
}


----
-- go install golang.org/x/tools/gopls@latest
nvim_lsp['gopls'].setup{
  on_attach = on_attach
}


----
-- json: npm i -g vscode-langservers-extracted
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
-- lua-dev.nvim : https://github.com/folke/lua-dev.nvim
HOME = vim.fn.expand('$HOME')

local sumneko_root_path = ""
local sumneko_binary = ""

sumneko_root_path = HOME ..  "/src/clones/lua-language-server"
sumneko_binary = HOME ..  "/src/clones/lua-language-server/bin/macOS/lua-language-server"

local luadev = require("lua-dev").setup({
    library = {vimruntime = true, types = true, plugins = true},
    lspconfig = {
        -- capabilities = capabilities,
        on_attach = on_attach,
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        ['/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/'] = true,
                    }
                }
            }
        }
    }
})
nvim_lsp['sumneko_lua'].setup(luadev)



----
-- python: https://github.com/python-lsp/python-lsp-server
nvim_lsp['pylsp'].setup{
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern('.git');
  settings = {
    pylsp = {
      plugins = {
        yapf = {enabled = false},
        pylint = {enabled = false},
        pycodestyle = {enabled = false},
        pyflakes = {enabled = false},
        pydocstyle = {enabled = false},
        flake8 = {enabled = true}
      },
      type = "string"
    }
  }
}



----
-- terraform: https://github.com/hashicorp/terraform-ls
-- brew install hashicorp/tap/terraform-ls
nvim_lsp['terraformls'].setup{
  cmd = { "terraform-ls", "serve" },
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
