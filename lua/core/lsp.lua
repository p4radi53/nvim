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
