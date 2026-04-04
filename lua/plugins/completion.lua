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

-- Blink CMP
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.0") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})
local sources = { "lsp", "path", "snippets", "buffer" }
local providers = {}
if Config.languages.lua then
	table.insert(sources, 1, "lazydev")
	providers.lazydev = {
		name = "LazyDev",
		module = "lazydev.integrations.blink",
		score_offset = 100,
	}
end
require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
	signature = { enabled = true },
	completion = { documentation = { auto_show = true } },
	sources = { default = sources, providers = providers },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
