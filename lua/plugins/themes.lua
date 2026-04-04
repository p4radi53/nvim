vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
})

require("tokyonight").setup({ style = "night" })
require("catppuccin").setup({ transparent_background = true })
