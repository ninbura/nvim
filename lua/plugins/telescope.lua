return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ff",
      function() require("telescope.builtin").find_files() end,
      desc = "search files by name within current directory"
    },
    {
      "<leader>fg",
      function() require("telescope.builtin").git_files() end,
      desc = "search files by name registered in git"
    },
    {
      "<leader>fb",
      function() require("telescope.builtin").buffers() end,
      desc = "search open buffers by name"
    },
    {
      "<leader>fs",
      function() require("telescope.builtin").grep_string({ search = vim.fn.input("greup > ") }) end,
      desc = "search contents of all files in current directory for given input string"
    },
  }
}
