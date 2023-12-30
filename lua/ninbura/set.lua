-- set leader key
vim.g.mapleader = " "

-- enable line numbers and set relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "%userprofile%/appdata/local/nvim/undodir"
vim.opt.undofile = true

-- searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- terminal colors
vim.opt.termguicolors = true

-- scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- faster update time (idk)
vim.opt.updatetime = 50

-- color column (idk)
vim.opt.colorcolumn = "182"
