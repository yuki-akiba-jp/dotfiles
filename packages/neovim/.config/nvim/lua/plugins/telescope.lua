local lga_actions = require("telescope-live-grep-args.actions")
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".vscode",
      ".idea",
      ".DS_Store",
      ".next",
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt({ postfix = " --iglob **" }), -- add path like **/plugins/**
        },
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'noice')
pcall(require("telescope").load_extension("live_grep_args"))
require('telescope').load_extension('git_worktree')
