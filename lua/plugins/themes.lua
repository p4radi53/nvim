vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
})

---@diagnostic disable-next-line: missing-fields
require("tokyonight").setup({ style = "night" })
