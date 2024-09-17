local lsp_zero = require('lsp-zero')

local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup{}

lspconfig.clangd.setup {}

lspconfig.pyright.setup {
    settings = {
        python = {
            analysis = {
                extraPaths = {"./src"},
                autoSearchPaths = true,
                useLibraryCodeForTypes = true
            }
        }
    }
}

--lspconfig.angularls.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities
}

lspconfig.cssls.setup {
    capabilities = capabilities
}

lspconfig.tailwindcss.setup {}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

