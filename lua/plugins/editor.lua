-- Gitsigns
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gs.nav_hunk("next")
			end
		end, "Next git hunk")

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gs.nav_hunk("prev")
			end
		end, "Previous git hunk")

		map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, "Blame line")
		map({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk")
		map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk")
		map("o", "ih", "<cmd>Gitsigns select_hunk<cr>", "Inside hunk (text object)")
		map("x", "ih", "<cmd>Gitsigns select_hunk<cr>", "Inside hunk (text object)")
	end,
})

-- Treesitter (run :TSUpdate after install)
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })
require("nvim-treesitter").setup()
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
local parsers = {
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
}

for _, parser in ipairs(parsers) do
	require("nvim-treesitter").install(parser):wait(30000)
end
vim.treesitter.language.register("hocon", "hocon")

-- mini.nvim modules
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "stable" },
})
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
require("mini.statusline").setup({ use_icons = true })

-- Conform
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

-- Trouble
vim.pack.add({ { src = "https://github.com/folke/trouble.nvim" } })
require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xr",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP References (Trouble)" }
)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
