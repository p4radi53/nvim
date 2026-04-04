-- Copilot
if Config.copilot then
	vim.pack.add({ { src = "https://github.com/github/copilot.vim" } })
	vim.g.copilot_no_tab_map = true
	vim.keymap.set("i", "<C-a>", 'copilot#Accept("<CR>")', {
		expr = true,
		silent = true,
		replace_keycodes = false,
		desc = "Accept Copilot suggestion",
	})
end

-- Avante (requires `make` in plugin dir after install)
if Config.avante then
	vim.pack.add({ { src = "https://github.com/yetone/avante.nvim" } })
	require("avante").setup({
		instructions_file = "avante.md",
		provider = "copilot",
	})
end
