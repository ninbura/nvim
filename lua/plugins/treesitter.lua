-- nvim-treesitter `main` branch (the rewrite). The old `nvim-treesitter.configs`
-- module is gone: parsers are installed with `install()`, and highlighting is
-- Neovim's own `vim.treesitter.start()`, turned on per buffer below.
local parsers = {
  "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust", "markdown",
  "markdown_inline", "bash", "c_sharp", "css", "html", "dockerfile", "gitignore",
  "json", "sql", "ssh_config", "xml", "yaml", "diff", "razor"
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- ensure_installed: installs in the background, skips ones already present.
    ts.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("ninvim_treesitter", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then return end

        -- highlight.enable (replaces additional_vim_regex_highlighting = false)
        if pcall(vim.treesitter.start, args.buf, lang) then return end

        -- auto_install: fetch a missing parser for this filetype, then start it.
        if vim.tbl_contains(ts.get_available(), lang) then
          ts.install(lang):await(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              pcall(vim.treesitter.start, args.buf, lang)
            end
          end)
        end
      end,
    })
  end,
}
