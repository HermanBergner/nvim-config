local global = vim.g
local o = vim.opt

-- Line numbers
o.nu = true
o.rnu = true

-- Tabs and indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- Line wrapping
o.wrap = false

-- Search
o.ignorecase = true
o.smartcase = true

-- Backspace
o.backspace = 'indent,eol,start'

-- Clipboard
o.clipboard:append('unnamedplus')

-- Swap file
o.swapfile = false

-- Scrolloff
o.scrolloff = 8

o.termguicolors = true
o.background = 'dark'
o.signcolumn = 'yes'


o.splitright = true
o.splitbelow = true
