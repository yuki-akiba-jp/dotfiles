require('mason').setup({ 'prettier' })
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
  tsserver = {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  pyright = {},
  tailwindcss = {},
  eslint = {},
  dockerls = {},
  jsonls = {},
  yamlls = {},
  taplo = {},
  jdtls = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name] and servers[server_name].settings,
      filetypes = servers[server_name] and servers[server_name].filetypes,
    }
  end,
}

require('lspconfig').jdtls.setup({})
