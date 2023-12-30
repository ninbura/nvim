require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {'TelescopeBorder', 'TelescopeTitle', 'TelescopeNormal', 'TelescopePromptNormal', 'NormalFloat', 'FloatBorder'}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

vim.cmd.colorscheme("rose-pine")
vim.cmd.TransparentEnable()
