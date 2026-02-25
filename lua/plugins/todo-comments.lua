return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next Todo Comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous Todo Comment",
		},
		{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo Comments (Trouble)" },
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo Comments",
		},
	},
}
