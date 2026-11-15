return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      -- Clears the editor, float, telescope, status line and completion menu
      -- backgrounds so the terminal's transparency shows through. Replaces
      -- transparent.nvim.
      styles = { transparency = true },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
