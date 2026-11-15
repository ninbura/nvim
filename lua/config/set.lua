-- leader keys (set before lazy.nvim loads so plugin mappings use them)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- enable line numbers and set relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- add window number to status line
vim.opt.statusline = ' #%{winnr()}      %f %= %l,%c      %P '

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.colorcolumn = "182"

vim.opt.guicursor = {
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}

-- set default terminal to powershell 7 if computer is running windows
if(vim.uv.os_uname().sysname == "Windows_NT")
  then
    vim.opt.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
    vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
    vim.opt.shellredir = "2>&1 | %%{ '$_' } | Out-File %s; exit $LastExitCode"
    vim.opt.shellpipe = "2>&1 | %%{ '$_' } | tee %s; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
  end
