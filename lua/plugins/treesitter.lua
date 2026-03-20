return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "master",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"python",
					"rust",
					"java",
					"javascript",
					"typescript",
					"html",
					"css",
					"terraform",
					"hcl",
					"yaml",
					"toml",
					"json",
					"markdown",
					"go",
					"just",
          "sql",
          "hocon",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
