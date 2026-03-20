return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim", -- optional, for faster sorting
	},
	opts = {
		defaults = {
			layout_strategy = "horizontal",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					hidden = true, -- matches Snacks.picker.hidden
					prompt_title = "Smart Find Files",
				})
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({
					show_all_buffers = true,
					sort_lastused = true,
					prompt_title = "Buffers",
				})
			end,
			desc = "Buffers",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").live_grep({
					prompt_title = "Grep",
				})
			end,
			desc = "Grep",
		},
	},
}
