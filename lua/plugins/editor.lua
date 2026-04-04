-- Gitsigns
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require("gitsigns").setup()

-- Treesitter (run :TSUpdate after install)
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })
require("nvim-treesitter").setup({
	ensure_installed = {
		"c", "lua", "vim", "python", "rust", "java",
		"javascript", "typescript", "html", "css",
		"terraform", "hcl", "yaml", "toml", "json",
		"markdown", "go", "just", "sql", "hocon",
	},
	highlight = { enable = true },
	indent = { enable = true },
})

-- mini.pairs
vim.pack.add({ { src = "https://github.com/echasnovski/mini.pairs" } })
require("mini.pairs").setup()

-- Conform
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

-- Todo Comments
vim.pack.add({ { src = "https://github.com/folke/todo-comments.nvim" } })
require("todo-comments").setup()
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next Todo Comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous Todo Comment" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo Comments (Trouble)" })
vim.keymap.set("n", "<leader>ft", function() Snacks.picker.todo_comments() end, { desc = "Todo Comments" })

-- Trouble
vim.pack.add({ { src = "https://github.com/folke/trouble.nvim" } })
require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP References (Trouble)" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
