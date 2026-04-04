-- Lualine
vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim" } })
require("lualine").setup({ options = { theme = "material" } })

-- Snacks
vim.pack.add({ { src = "https://github.com/folke/snacks.nvim" } })
require("snacks").setup({
	quickfile = { enabled = true },
	indent = { enabled = true },
	bigfile = { enabled = true },
	input = { enabled = true },
	terminal = { enabled = true },
	dashboard = {
		enabled = true,
		preset = {
			header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⣿⣿⣶⣄⠹⣿⣿⣿⡟⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⡆⢹⣿⣿⣿⣷⡀⠀
⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⡇⠀
⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⠟⠁⠀
⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠹⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⢿⣿⣿⣿⣿⡄⠀⠀⠀⠀
⠀⠀⢀⣿⣿⣿⣿⣿⡟⢀⣿⣿⣿⣿⣿⣿⡿⠟⢁⡄⠸⣿⣿⣿⣿⣷⠀⠀⠀⠀
⠀⠀⣼⣿⣿⣿⣿⠏⠀⣈⡙⠛⢛⠋⠉⠁⠀⣸⣿⣿⠀⢻⣿⣿⣿⣿⡆⠀⠀⠀
⠀⢠⣿⣿⣿⣿⣟⠀⠀⢿⣿⣿⣿⡄⠀⠀⢀⣿⣿⡟⠃⣸⣿⣿⣿⣿⡇⠀⠀⠀
⠀⠘⠛⠛⠛⠛⠛⠛⠀⠘⠛⠛⠛⠛⠓⠀⠛⠛⠛⠃⠘⠛⠛⠛⠛⠛⠃⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀embr4ce m0nke⠀⠀⠀⠀⠀⠀
]],
		},
		sections = {
			{ section = "header" },
			{ title = "Recent files", padding = 1 },
			{ section = "recent_files", cwd = true, limit = 5, padding = 1 },
			{ title = "Keymaps", padding = 1 },
			{ section = "keys", gap = 1, padding = 1 },
		},
	},
})
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
	Snacks.terminal.toggle(nil, { win = { position = "float" } })
end, { desc = "Toggle Floating Terminal" })

-- Which-key
vim.pack.add({ { src = "https://github.com/folke/which-key.nvim" } })
vim.o.timeoutlen = 500
require("which-key").add({
	{ "<leader>f", group = "Fuzzy Finder" },
	{ "<leader>c", group = "Code actions" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>a", group = "AI" },
	{ "<leader>x", group = "Trouble / Diagnostics" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>v", group = "Venv" },
})
