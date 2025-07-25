return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
      --vim.keymap.set('n', '<leader>ps', function ()
      --	builtin.grep_string({ search = vim.fn.input("Grep > ") });
      --end)
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    enabled = true,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
