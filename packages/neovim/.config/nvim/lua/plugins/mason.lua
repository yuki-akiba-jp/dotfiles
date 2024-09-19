require('mason').setup()
require('mason-lspconfig').setup()

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gh', vim.lsp.buf.hover, 'Hover Documentation')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('FF', vim.lsp.buf.format, '[F]ormat')
end

local servers = {
  ts_ls = {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  pyright = {},
  tailwindcss = {},
  eslint = {},
  dockerls = {},
  jsonls = {},
  yamlls = {},
  taplo = {},
  jdtls = {
    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = "interactive",
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        format = {
          enabled = true,
          settings = {
            url = "~/formatter.xml"
          }
        },
      },
    },
    init_options = {
      bundles = {},
    },
  },
  html = { filetypes = { 'html', 'twig', 'hbs' } },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for server_name, config in pairs(servers) do
  require('lspconfig')[server_name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = config.settings,
    filetypes = config.filetypes,
    init_options = config.init_options,
  }
end

require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
}

require('mason-lspconfig').setup_handlers {
  function(server_name)
    local config = servers[server_name] or {}
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = config.settings,
      filetypes = config.filetypes,
      init_options = config.init_options,
    }
  end,
}

require('lspconfig').jdtls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = servers.jdtls.settings,
  init_options = servers.jdtls.init_options,
}

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.java",
  callback = function()
    vim.lsp.buf.format()
  end,
})
