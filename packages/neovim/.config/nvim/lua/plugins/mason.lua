local servers = {
  tsserver = {},
  pyright = {},
  tailwindcss = {},
  eslint = {},
  dockerls = {},
  jsonls = {},
  yamlls = {},
  taplo = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
}

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

  -- See `:help K` for why this keymap
  nmap('gh', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gH', vim.lsp.buf.signature_help, 'Signature Documentation')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('FF', vim.lsp.buf.format, '[F]ormat')
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
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
