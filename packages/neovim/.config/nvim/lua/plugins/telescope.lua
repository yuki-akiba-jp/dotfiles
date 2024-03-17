require('telescope').load_extension('git_worktree')
require('telescope').setup {

  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".vscode",
      ".idea",
      ".DS_Store",
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
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'noice')
