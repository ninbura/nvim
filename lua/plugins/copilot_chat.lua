return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>cc", ":CopilotChatOpen<CR>", desc = "Open Copilot Chat" },
      { "<leader>cq", ":CopilotChatClose<CR>", desc = "Close Copilot Chat" },
    },
    opts = {
      -- debug = true, -- Enable debugging if needed
    },
    lazy = true,
  },
}