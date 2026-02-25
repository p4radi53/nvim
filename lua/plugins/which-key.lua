return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeoutlen = 500
		end,
		opts = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>f", group = "Fuzzy Finder" },
				{ "<leader>c", group = "Code actions" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>a", group = "AI" },
			})
		end,
	},
}
