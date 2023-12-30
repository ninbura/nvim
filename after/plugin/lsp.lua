require("neodev").setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup()
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {
	  'tsserver',
	  'rust_analyzer',
	  'eslint',
	  'lua_ls',
	  'dockerls',
	  'docker_compose_language_service',
	  'powershell_es',
	  'postgres_lsp',
	  'tailwindcss'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
