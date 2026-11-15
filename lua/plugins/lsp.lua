-- Native Neovim LSP (0.11+) with mason. Replaces lsp-zero, which is archived
-- and relied on mason-lspconfig's removed `handlers` option. Kept: the same
-- servers and lsp-zero's default keymaps. Completion is Neovim's built-in LSP
-- completion (the nvim-cmp that was here was never set up).
local servers = {
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "lua_ls",
  "powershell_es",
  "sqls",
  "rust_analyzer",
  "tailwindcss",
  "vtsls",
}

-- lsp-zero's default_keymaps. Like lsp-zero, a key that's already mapped is
-- left alone (Neovim's own defaults and your mappings win).
local function default_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    if vim.fn.mapcheck(lhs, mode) ~= "" then return end
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, nowait = true })
  end

  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "gs", vim.lsp.buf.signature_help, "Show function signature")
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "go", vim.lsp.buf.type_definition, "Go to type definition")
  map("n", "gr", vim.lsp.buf.references, "Go to reference")
  map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<F3>", function() vim.lsp.buf.format({ async = true }) end, "Format file")
  map("x", "<F3>", function() vim.lsp.buf.format({ async = true }) end, "Format selection")
  map("n", "<F4>", vim.lsp.buf.code_action, "Execute code action")
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = { log_level = vim.log.levels.INFO } },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Completion menu: show it for a single match, don't preselect, and show
      -- documentation in a popup beside it.
      vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("ninvim_lsp", { clear = true }),
        callback = function(args)
          default_keymaps(args.buf)

          -- Built-in completion, opening automatically as you type.
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end
        end,
      })

      -- Installs the servers and enables every mason-installed server.
      require("mason-lspconfig").setup({ ensure_installed = servers })
    end,
  },

  -- Replaces neodev.nvim (archived): Neovim Lua API completion for lua_ls.
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
