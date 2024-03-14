local opt = vim.opt
local global = vim.g

-- line numbers
opt.nu = true
opt.rnu = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- swap file
opt.swapfile = false

-- scroll off
opt.scrolloff = 8
