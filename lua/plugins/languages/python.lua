return {
	{
		"linux-cultist/venv-selector.nvim",
		enabled = Config.languages.python,
		ft = "python",
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
		},
		opts = {},
	},
}
