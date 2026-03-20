return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			container = {
				enable_character_fade = true,
			},
			filesystem = {
				group_empty_dirs = true, -- 👈 this is the key option
				follow_current_file = {
					enabled = true,
				},
			},
		},
		keys = {
			{
				"<leader>e",
				"<Cmd>Neotree toggle<CR>",
				mode = { "n", "t" },
				desc = "Neotree",
			},
		},
	},
}
