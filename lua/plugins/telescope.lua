return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim", -- optional, for faster sorting
	},
	opts = {
		defaults = {
			buffer_previewer_maker = function(filepath, bufnr, opts)
				local telescope = require("telescope")
				local previewers = require("telescope.previewers")
				local original_maker = previewers.buffer_previewer_maker

				original_maker(filepath, bufnr, opts)
				if filepath:match("%.conf$") then
					vim.schedule(function()
						vim.bo[bufnr].filetype = "hocon"
					end)
				end
			end,
			layout_strategy = "horizontal",
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				local ok = pcall(
					require("telescope.builtin").git_files,
					{ show_untracked = true, prompt_title = "Smart Find Files" }
				)
				if not ok then
					require("telescope.builtin").find_files({ hidden = true, prompt_title = "Smart Find Files" })
				end
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
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git Status",
		},
	},
}
