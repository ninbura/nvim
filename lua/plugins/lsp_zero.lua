return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "folke/neodev.nvim",
    "jlcrochet/vim-razor"
  },

  config = function()
    require("neodev").setup()

    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require("mason").setup {
      -- log_level = vim.log.levels.DEBUG
      log_level = vim.log.levels.INFO
    }

    require("mason-lspconfig").setup({
      -- Replace the language servers listed here 
      -- with the ones you want to install
      ensure_installed = {
        "tsserver",
        "rust_analyzer",
        "eslint",
        "lua_ls",
        "dockerls",
        "docker_compose_language_service",
        "powershell_es",
        "sqlls",
        "tailwindcss"
      },
      handlers = {
        lsp_zero.default_setup,
      }
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  end
}
