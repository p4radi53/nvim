-- HOCON file parsing
vim.filetype.add({ extension = { conf = "hocon" } })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("hocon", { clear = true }),
	pattern = "hocon",
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})
