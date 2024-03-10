require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
		require('neotest-rspec')({
			env = { CI = true },
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
		require('neotest-minitest')({
			env = { CI = true },
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
	},
})

vim.api.nvim_set_keymap("n", "tt", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})


-- Function to check if the current file is a test file
local function is_test_file()
    local file_name = vim.fn.expand("%:t")
    return file_name:match("%.test%.tsx?$") ~= nil
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.ts", "*.tsx", "*.rb"},
  callback = function()
      if is_test_file() then
				require("neotest").run.run(vim.fn.expand("%"))
      end
  end
})
