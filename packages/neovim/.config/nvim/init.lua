require('options')

require('plugins.lazy')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.cmp')
require('plugins.mason')
require('plugins.whichkey')
require('plugins.bufferline')
require('plugins.dap')
require('plugins.neotest')
require('plugins.nvim_tree')
require('plugins.git_worktree')
require('plugins.toggleterm')
require('plugins.noice')
require('plugins.onedark')
require('plugins.formatter')

require('neodev').setup()
require('keymaps')
require('autocmd')
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.cmd([[autocmd ColorScheme * highlight Comment guifg=#5C6370 gui=italic]])
vim.cmd([[autocmd ColorScheme * highlight LineNr guibg=none guifg=#A5A5A5 gui=italic]])
vim.cmd([[autocmd ColorScheme * highlight StatusLine guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight StatusLineNC guibg=none]])
vim.cmd([[autocmd ColorScheme * highlight Statement guifg=#98C379]])
vim.cmd([[autocmd ColorScheme * highlight DiffAdd guibg=#1B2B34]])
vim.cmd([[autocmd ColorScheme * highlight Identifier guifg=#98C379]])
vim.cmd([[autocmd ColorScheme * highlight DiffChanged guibg=#3366FF]])
