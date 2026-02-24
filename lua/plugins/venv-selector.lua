return {
  "linux-cultist/venv-selector.nvim",
  enabled = Config.languages.python,
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {},
  event = "VeryLazy",
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Venv Selection" },
  },
}
