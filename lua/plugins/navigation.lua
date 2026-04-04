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
		buffer_previewer_maker = function(filepath, bufnr, opts)
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
		layout_config = { prompt_position = "top" },
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

-- Harpoon (harpoon2 branch)
vim.pack.add({ { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" } })
-- local harpoon = require("harpoon")
-- harpoon:setup()
-- vim.keymap.set("n", "<leader>ha", function()
-- 	harpoon:list():add()
-- end, { desc = "Add to harpoon" })
-- vim.keymap.set("n", "<leader>hr", function()
-- 	harpoon:list():remove()
-- end, { desc = "Remove from harpoon" })
-- vim.keymap.set("n", "<leader>hh", function()
-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
-- end, { desc = "Harpoon menu" })
-- for i = 1, 5 do
-- 	vim.keymap.set("n", "<leader>" .. i, function()
-- 		harpoon:list():select(i)
-- 	end, { desc = "Harpoon file " .. i })
-- end

-- Tmux Navigator
vim.pack.add({ { src = "https://github.com/christoomey/vim-tmux-navigator" } })
vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
