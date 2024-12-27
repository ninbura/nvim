return {
  'xiyaowong/transparent.nvim',
  priority = 1000,
  config = function()
    require("transparent").setup({ -- Optional, you don't have to run setup.
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'EndOfBuffer'
      },
      extra_groups = {'TelescopeBorder', 'TelescopeTitle', 'TelescopeNormal', 'TelescopePromptNormal', 'NormalFloat', 'FloatBorder'},
      exclude_groups = {},
    })

    vim.cmd.TransparentEnable()
  end
}
