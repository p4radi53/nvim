local map = vim.keymap.set

-- Format
map({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format" })

-- General
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Write and quit" })
map("n", "<leader>w", ":write<CR>", { desc = "Write" })
map("n", "U", "<C-r>", { desc = "Redo" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- Disable page keys
map({ "n", "i" }, "<PageDown>", "<Nop>", { silent = true })
map({ "n", "i" }, "<PageUp>", "<Nop>", { silent = true })

-- LSP (on attach)
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP keymaps",
	callback = function(event)
		local opts = { buffer = event.buf }
		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		map("n", "<leader>cq", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>:copen<cr>", opts)
		map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})
