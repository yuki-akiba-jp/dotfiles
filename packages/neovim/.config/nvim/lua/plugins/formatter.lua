
require('formatter').setup {
  logging = false,
  log_level = vim.log.levels.WARN,

  filetype = {
    lua = {
      require('formatter.filetypes.lua').stylua,
    },

    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },

    javascriptreact = {
      require('formatter.filetypes.javascript').prettier,
    },

    typescriptreact = {
      require('formatter.filetypes.typescript').prettier,
    },

    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },

    svelte = {
      require('formatter.filetypes.svelte').prettier,
    },

    vue = {
      require('formatter.filetypes.vue').prettier,
    },

    css = {
      require('formatter.filetypes.css').prettier,
    },

    yaml = {
      require('formatter.filetypes.yaml').prettier,
    },

    json = {
      require('formatter.filetypes.json').prettier,
    },

    terraform = {
      require('formatter.filetypes.terraform').terraformfmt,
    },

    go = {
      require('formatter.filetypes.go').gofmt,
    },

    rust = {
      require('formatter.filetypes.rust').rustfmt,
    },

    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
}

-- prevent formatting at work
-- TODO: make this a persistent toggle
-- if USER == '' then
--   vim.cmd [[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost * FormatWrite
--   augroup END
--   ]]
-- end
