-- Feature flags with defaults.
-- Override these in lua/config/local.lua (see local.lua.example).
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
-- Load local overrides before plugins
pcall(require, "config.local")

-- Validate Config against defaults, warn on unknown keys
local warnings = require("config.validate").validate(Config, defaults)
for _, w in ipairs(warnings) do
	vim.notify(w, vim.log.levels.WARN)
end

require("config.lazy")
require("config.keymap")
require("config.options")

vim.cmd.colorscheme(Config.theme)

-- Conditionally enable LSP servers based on language flags
local lsp_map = {
	python = { "pyright", "ruff" },
	lua = { "lua_ls" },
	java = { "jdtls" },
	go = { "gopls" },
	terraform = { "terraformls" },
	rust = { "rust-analyzer" },
	c = { "clangd" },
	typescript = { "tsls" },
}

for lang, servers in pairs(lsp_map) do
	if Config.languages[lang] then
		vim.lsp.enable(servers)
	end
end

-- Make clipboard work on WSL (requires xclip installed)
vim.opt.clipboard = "unnamedplus"
