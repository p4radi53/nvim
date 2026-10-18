vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
})

---@diagnostic disable-next-line: missing-fields
require("tokyonight").setup({ style = "night" })
