return {
	{
		"mfussenegger/nvim-dap",
		enabled = Config.dap,
		keys = {
			{ "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
			{ "<leader>dc", ":DapContinue<CR>", desc = "Continue" },
			{ "<leader>dt", ":DapTerminate<CR>", desc = "Terminate" },
			{ "<leader>do", ":DapStepOver<CR>", desc = "Step over" },
			{ "<leader>di", ":DapStepInto<CR>", desc = "Step into" },
			{ "<leader>du", ":DapStepOut<CR>", desc = "Step out" },
			{
				"<leader>dv",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle debug view",
			},
		},
		dependencies = {
			"nvim-neotest/nvim-nio",
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					local dapui = require("dapui")
					dapui.setup()
					local dap = require("dap")
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
				end,
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		enabled = Config.dap,
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		opts = {},
	},
	{
		"mfussenegger/nvim-dap-python",
		enabled = Config.dap,
		ft = "python",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dap-python").setup("debugpy-adapter")
		end,
	},
}
