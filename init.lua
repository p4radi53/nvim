vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

---@class Config
_G.Config = {
	theme = "tokyonight-night",
	copilot = true,
	avante = true,
	dap = true,
	languages = {
		python = true,
		lua = true,
		java = true,
		go = true,
		terraform = true,
		rust = true,
		c = true,
		typescript = true,
		scala = true,
		markdown = true,
	},
}

local defaults = vim.deepcopy(Config)
pcall(require, "core.local")

local warnings = require("core.validate").validate(Config, defaults)
for _, w in ipairs(warnings) do
	vim.notify(w, vim.log.levels.WARN)
end

require("core.options")
require("core.keymaps")
require("plugins")

vim.cmd.colorscheme(Config.theme)

require("core.lsp")
require("core.autocmds")
