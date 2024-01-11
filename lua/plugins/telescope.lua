return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ff",
      function() require("telescope.builtin").find_files() end,
      desc = "global file search within directory"
    },
    {
      "<leader>gf",
      function() require("telescope.builtin").git_files() end,
      desc = "search for files registered in git within directory"
    },
    {
      "<leader>pf",
      function() require("telescope.builtin").grep_string({ search = vim.fn.input("greup > ") }) end,
      desc = "search contents of all files for given input string"
    }
  }
}
