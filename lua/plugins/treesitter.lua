return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust", "markdown",
        "markdown_inline", "bash", "c_sharp", "css", "html", "dockerfile", "gitignore",
        "json", "sql", "ssh_config", "xml", "yaml", "diff"
      },
      modules = {},
      ignore_install = {},
      parser_install_dir = nil,
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })
  end
}
