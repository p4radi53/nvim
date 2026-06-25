-- Lazydev (loaded before blink.cmp for source integration)
if Config.languages.lua then
	vim.pack.add({ { src = "https://github.com/folke/lazydev.nvim" } })
	require("lazydev").setup({
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "snacks.nvim", words = { "Snacks" } },
		},
	})
end

-- Java
if Config.languages.java then
	vim.pack.add({ { src = "https://github.com/nvim-java/nvim-java" } })
end

-- Scala
if Config.languages.scala then
	vim.pack.add({ { src = "https://github.com/scalameta/nvim-metals" } })
	local metals_config = require("metals").bare_config()
	local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = { "scala", "sbt" },
		callback = function()
			require("metals").initialize_or_attach(metals_config)
		end,
	})
end

-- Python
if Config.languages.python then
	vim.pack.add({ { src = "https://github.com/linux-cultist/venv-selector.nvim" } })
	require("venv-selector").setup()
	vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Python venv" })
end

-- Markdown
if Config.languages.markdown then
	vim.pack.add({ { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" } })
	require("render-markdown").setup()
end
