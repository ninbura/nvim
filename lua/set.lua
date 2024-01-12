-- set leader key
vim.g.mapleader = " "

-- enable line numbers and set relative
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%-3{v:lnum} %-2{v:relnum} %=%s"

-- vim.api.nvim_create_autocmd("BufEnter", { callback = function() print(vim.bo.filetype) end })

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
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

-- guide for linebreaking long bits of code
vim.opt.colorcolumn = "180"

-- set default terminal to powershell 7 if computer is running windows
if(vim.loop.os_uname().sysname == "Windows_NT")
  then
    vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
  end
