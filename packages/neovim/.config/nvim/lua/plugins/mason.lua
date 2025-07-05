require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  ts_ls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  pyright      = {},
  tailwindcss  = {},
  eslint       = {},
  dockerls     = {},
  jsonls       = {},
  yamlls       = {},
  taplo        = {},
  html         = { filetypes = { "html", "twig", "hbs" } },
  jdtls = {
    settings = {
      java = {
        eclipse = { downloadSources = true },
        configuration = { updateBuildConfiguration = "interactive" },
        maven = { downloadSources = true },
        implementationsCodeLens = { enabled = true },
        referencesCodeLens       = { enabled = true },
        references = { includeDecompiledSources = true },
        format = {
          enabled  = true,
          settings = { url = "~/formatter.xml" },
        },
      },
    },
    init_options = { bundles = {} },
  },
}

local on_attach = function(_, bufnr)
  local nmap = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc and ("LSP: " .. desc) })
  end
  nmap("rn", vim.lsp.buf.rename,        "[R]e[n]ame")
  nmap("ca", vim.lsp.buf.code_action,   "[C]ode [A]ction")
  nmap("gD", vim.lsp.buf.declaration,   "[G]oto [D]eclaration")
  nmap("gh", vim.lsp.buf.hover,         "Hover Documentation")
  nmap("FF", vim.lsp.buf.format,        "[F]ormat")

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
  handlers = {
    function(server_name)
      local cfg = servers[server_name] or {}
      require("lspconfig")[server_name].setup({
        capabilities  = capabilities,
        on_attach     = on_attach,
        settings      = cfg.settings,
        filetypes     = cfg.filetypes,
        init_options  = cfg.init_options,
      })
    end,

    ["jdtls"] = function()
      local cfg = servers.jdtls
      require("lspconfig").jdtls.setup({
        capabilities = capabilities,
        on_attach    = on_attach,
        settings     = cfg.settings,
        init_options = cfg.init_options,
      })
    end,
  },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.java",
  callback = function() vim.lsp.buf.format() end,
})
