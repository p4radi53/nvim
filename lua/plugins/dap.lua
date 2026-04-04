if not Config.dap then
	return
end

vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>dt", ":DapTerminate<CR>", { desc = "Terminate" })
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>du", ":DapStepOut<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dv", function()
	dapui.toggle()
end, { desc = "Toggle debug view" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	once = true,
	callback = function()
		require("dap-go").setup()
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	once = true,
	callback = function()
		require("dap-python").setup("debugpy-adapter")
	end,
})
