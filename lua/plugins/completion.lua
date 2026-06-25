-- Blink CMP
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			-- hardcoded path; update if vim.pack install_dir changes
			local dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/blink.cmp"
			vim.notify("blink.cmp: building...", vim.log.levels.INFO)
			vim.system({ "cargo", "build", "--release" }, { cwd = dir }, function(result)
				vim.schedule(function()
					if result.code ~= 0 then
						vim.notify("blink.cmp build failed:\n" .. result.stderr, vim.log.levels.ERROR)
					else
						vim.notify("blink.cmp built successfully", vim.log.levels.INFO)
					end
				end)
			end)
		end
	end,
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
