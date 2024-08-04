vim.api.nvim_set_keymap('n', '<C-n>', '<C-i>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<BS>', ':tabprev<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprev<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzz', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { silent = true, noremap = true })
vim.api.nvim_set_keymap('v', 'p', 'pgvy', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '*', '*Nzz', { silent = true, noremap = true })

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { silent = true })

vim.api.nvim_set_keymap('x', '&', ':&&<CR>', {})
vim.api.nvim_set_keymap('n', '&', ':&&<CR>', {})
vim.api.nvim_set_keymap('n', 'fo', 'o<ESC>', {})
vim.api.nvim_set_keymap('n', '<C-K>', ':wa<CR>', {})
vim.api.nvim_set_keymap('n', 'fq', ':q<CR>', {})
vim.api.nvim_set_keymap('n', 'ff', ':wq<CR>', {})
vim.api.nvim_set_keymap('n', 'fy', ':let @*=expand("%")<CR>', {})
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohl<CR>', {})


vim.api.nvim_set_keymap('n', 'gibr', '<cmd>vertical Git branch -vv<cr>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'git', '<cmd>vertical Git<cr>', { silent = true, noremap = true })
vim.keymap.set("n", "vv", "<cmd>DiffviewOpen HEAD~1<CR>")
vim.keymap.set("n", "vf", "<cmd>DiffviewFileHistory %<CR>")
vim.keymap.set("n", "vc", "<cmd>DiffviewClose<CR>")

vim.api.nvim_set_keymap('n', 'gilg',
  '<cmd>vertical Git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\'<CR>',
  { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', 'ma', '<cmd>lua require("harpoon.mark").add_file()<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'mm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'mf', '<cmd>Telescope harpoon marks<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<CR>',
  { silent = true, noremap = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<Space>', '<C-w>w', { silent = true })
vim.keymap.set('n', 'dl', require('telescope.builtin').diagnostics, { desc = '[D]iagnostics [L]ist' })
-- vim.keymap.set('n', 'gr', require('telescope.builtin').live_grep, { desc = '[F]ile [G]rep' })
-- vim.keymap.set('n', 'gs', require('telescope.builtin').grep_string, { desc = '[G]rep current word' })
vim.keymap.set("n", "gr", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "gs", require("telescope-live-grep-args.shortcuts").grep_word_under_cursor)

vim.keymap.set('n', 'gdd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
vim.api.nvim_set_keymap('n', 'gdt', '<cmd>lua vim.lsp.buf.definition()<CR><cmd>tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gdv', '<cmd>lua vim.lsp.buf.definition()<CR><cmd>vsplit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'gyy', require('telescope.builtin').lsp_type_definitions, { desc = '[G]oto t[Y]pe Definition' })
vim.api.nvim_set_keymap('n', 'gyt', '<cmd>lua vim.lsp.buf.type_definition()<CR><cmd>tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gyv', '<cmd>lua vim.lsp.buf.type_definition()<CR><cmd>vsplit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'qf', require('telescope.builtin').quickfix, { desc = '[Q]uick[F]ix' })
vim.keymap.set('n', 'go', require('telescope.builtin').oldfiles, { desc = '[G]oto [O]ld file' })
vim.keymap.set('n', 'gj', require('telescope.builtin').jumplist, { desc = '[G]oto [J]umplist' })
vim.keymap.set('n', 'gcm', require('telescope.builtin').git_commits, { desc = '[G]it [C]ommits' })

vim.keymap.set("n", "gww", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "gwc", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
vim.keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>', { desc = 'Toggle [E]xplorer' })
vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>', { desc = 'Toggle [T]erminal' })
vim.keymap.set('n', 'db', ':DBUIToggle<CR>', { desc = 'DBUI' })
vim.keymap.set('n', 'fu', vim.cmd.UndotreeToggle)
vim.keymap.set('n', 'cc', 'ggVGy', { desc = 'Copy All' })

-- prettier from mhartington/formatter.nvim
vim.keymap.set('n', 'FA', ':Format<CR>')

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.http",
    callback = function()
        vim.keymap.set('n', 'rr', '<cmd>Rest run<cr>', {buffer = true})
    end,
})
