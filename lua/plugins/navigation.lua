-- Neo-tree
vim.pack.add({ { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" } })
require("neo-tree").setup({
	close_if_last_window = true,
	container = { enable_character_fade = true },
	filesystem = {
		group_empty_dirs = true,
		follow_current_file = { enabled = true },
	},
})
vim.keymap.set({ "n", "t" }, "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Neotree" })

-- Telescope (telescope-fzf-native requires cmake; run `make` in its dir after install)
vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})
require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
		path_display = function(_, path)
			local tail = vim.fn.fnamemodify(path, ":t")
			local dir = vim.fn.fnamemodify(path, ":h")
			local display = tail .. "  " .. dir
			return display,
				{
					{ { 0, #tail }, "TelescopeResultsNormal" },
					{ { #tail + 2, #tail + 2 + #dir }, "TelescopeResultsComment" },
				}
		end,
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
})
require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>ff", function()
	local ok =
		pcall(require("telescope.builtin").git_files, { show_untracked = true, prompt_title = "Smart Find Files" })
	if not ok then
		require("telescope.builtin").find_files({ hidden = true, prompt_title = "Smart Find Files" })
	end
end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers({ show_all_buffers = true, sort_lastused = true, prompt_title = "Buffers" })
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").live_grep({ prompt_title = "Grep" })
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").git_status()
end, { desc = "Git Status" })
-- Files changed on current branch vs develop (three-dot = from merge-base, excludes develop's own changes)
vim.keymap.set("n", "<leader>fd", function()
	require("telescope.pickers")
		.new({}, {
			prompt_title = "My changes vs develop",
			finder = require("telescope.finders").new_oneshot_job(
				{ "git", "diff", "develop...HEAD", "--name-only" },
				{ entry_maker = require("telescope.make_entry").gen_from_file() }
			),
			sorter = require("telescope.config").values.file_sorter(),
			previewer = require("telescope.config").values.file_previewer({}),
		})
		:find()
end, { desc = "Files changed vs develop" })
vim.keymap.set("n", "<leader>fw", function()
	local displayer = require("telescope.pickers.entry_display").create({
		separator = "  ",
		items = { { width = 30 }, { remaining = true } },
	})
	require("telescope.pickers")
		.new({}, {
			prompt_title = "Worktrees",
			finder = require("telescope.finders").new_oneshot_job({ "git", "worktree", "list" }, {
				entry_maker = function(line)
					local path, branch = line:match("^(%S+)%s+%x+%s+%[(.-)%]")
					if path then
						local name = vim.fn.fnamemodify(path, ":t")
						return {
							value = path,
							ordinal = branch .. " " .. name,
							display = function()
								return displayer({
									{ branch, "TelescopeResultsIdentifier" },
									{ name, "Directory" },
								})
							end,
						}
					end
				end,
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local sel = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					vim.cmd.cd(sel.value)
				end)
				return true
			end,
		})
		:find()
end, { desc = "Worktrees" })

-- Tmux Navigator
vim.pack.add({ { src = "https://github.com/christoomey/vim-tmux-navigator" } })
vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
