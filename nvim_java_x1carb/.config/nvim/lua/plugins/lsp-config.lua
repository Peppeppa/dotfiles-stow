return {
  {
    "williamboman/mason.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    enabled = true,
    dependencies = 'hrsh7th/cmp-nvim-lsp',
  },
}

