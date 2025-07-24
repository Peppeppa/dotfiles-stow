return {
  "srcery-colors/srcery-vim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("srcery")
  end,
}

