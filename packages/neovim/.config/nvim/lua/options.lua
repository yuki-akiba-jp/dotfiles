vim.o.shell = "/bin/zsh"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.textwidth = 0
vim.o.autoindent = true
vim.o.hlsearch = true
vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.o.wrap = true
vim.o.pumheight = 10
vim.o.display = "lastline"
vim.o.background = "dark"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.buftype = ""
vim.o.encoding = "utf-8"
vim.o.iskeyword = "@,48-57,_,192-255,@-@"
vim.o.splitright = true
vim.wo.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.incsearch = true
vim.o.binary = true
vim.o.endofline = false

-- Enabling syntax highlighting and filetype detection
vim.cmd("syntax on")
vim.cmd("filetype on")
vim.cmd("set expandtab")
vim.cmd("language en_US.UTF-8")
vim.opt.termguicolors = true
vim.g.bracey_browser_command = "open"

-- Python 3 host program
vim.g.python3_host_prog = '/usr/bin/python3'
