return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    keys = {
      { "<leader>cc", ":CopilotChatOpen<CR>", desc = "Open Copilot Chat" },
      { "<leader>cq", ":CopilotChatClose<CR>", desc = "Close Copilot Chat" },
    },
    opts = {
      -- debug = true, -- Enable debugging if needed
    },
    lazy = true, -- Enable lazy loading based on keys
  },
}