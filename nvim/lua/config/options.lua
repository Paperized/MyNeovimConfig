-- Tree style in :Explore
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- numero linea relativo per fare COUNT+k/j
opt.relativenumber = true
opt.number = true


-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- mostra chiaramente la linea del cursor
opt.cursorline = true

-- custom color
opt.termguicolors = true
opt.background = "dark" -- can be light aswell
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

-- can paste the removed text on other applications
opt.clipboard:append("unnamedplus")
