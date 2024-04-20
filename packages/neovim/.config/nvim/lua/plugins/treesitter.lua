vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'ruby', 'rbs', 'php', 'javascript', 'typescript', 'vimdoc', 'vim', 'html', 'gitignore', 'tsx', 'markdown', 'json', 'yaml', 'toml', 'css', 'scss', 'graphql', 'dockerfile', 'lua', 'java', 'sql', 'regex' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
    },
    auto_install = false,

    highlight = {
      enable = true,


    },
    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = '@function.outer',
          [']]'] = '@class.outer',
          [']i'] = '@conditional.outer',
          [']l'] = '@loop.outer',
          [']a'] = '@parameter.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']['] = '@class.outer',
          [']I'] = '@conditional.outer',
          [']L'] = '@loop.outer',
          [']A'] = '@parameter.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[['] = '@class.outer',
          ['[i'] = '@conditional.outer',
          ['[l'] = '@loop.outer',
          ['[a'] = '@parameter.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[]'] = '@class.outer',
          ['[I'] = '@conditional.outer',
          ['[L'] = '@loop.outer',
          ['[A'] = '@parameter.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['sn'] = '@parameter.inner',
        },
        swap_previous = {
          ['sp'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)
