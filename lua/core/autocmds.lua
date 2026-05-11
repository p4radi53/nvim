-- HOCON file parsing
local hocon = vim.api.nvim_create_augroup("hocon", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = hocon,
	pattern = "*.conf",
	command = "set ft=hocon",
})

vim.api.nvim_create_autocmd("FileType", {
	group = hocon,
	pattern = "hocon",
	callback = function()
		vim.bo.commentstring = "// %s"
		vim.treesitter.start()
	end,
})
