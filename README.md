# nvim

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim). Requires Neovim 0.11+.

## Local Configuration

The shared configuration works out of the box with sensible defaults. To customize settings for your machine without affecting the shared repo, create a local config file:

```sh
cp lua/config/local.lua.example lua/config/local.lua
```

`lua/config/local.lua` is gitignored and will never be committed. It is loaded before plugins, so any overrides you set there take effect before anything else runs.

### Feature Flags

The configuration exposes a global `Config` table with feature flags. Override any of them in your `local.lua`:

```lua
-- Disable AI features
Config.copilot = false
Config.avante = false

-- Disable debugging support
Config.dap = false

-- Turn off languages you don't need
Config.languages.java = false
Config.languages.terraform = false

-- Enable languages that are off by default
Config.languages.scala = true

-- Switch the colorscheme
Config.theme = "catppuccin"
```

Disabling a language turns off its LSP server(s) and any related plugins (e.g. disabling `python` also disables `venv-selector`).

#### Available Flags

| Flag | Default | Controls |
|------|---------|----------|
| `Config.theme` | `"tokyonight-night"` | Colorscheme (`"tokyonight-night"`, `"catppuccin"`, `"rose-pine"`) |
| `Config.copilot` | `true` | GitHub Copilot |
| `Config.avante` | `true` | Avante AI assistant |
| `Config.dap` | `true` | Debug Adapter Protocol (nvim-dap) |
| `Config.languages.python` | `true` | pyright, ruff, venv-selector |
| `Config.languages.lua` | `true` | lua_ls |
| `Config.languages.java` | `true` | jdtls, nvim-java |
| `Config.languages.go` | `true` | gopls, nvim-dap-go |
| `Config.languages.terraform` | `true` | terraformls |
| `Config.languages.rust` | `true` | rust-analyzer |
| `Config.languages.c` | `true` | clangd |
| `Config.languages.typescript` | `true` | tsls |
| `Config.languages.scala` | `false` | nvim-metals |
| `Config.languages.markdown` | `true` | render-markdown.nvim |

### Other Overrides

Since `local.lua` is plain Lua loaded early in the startup sequence, you can also override editor options, add keymaps, or set machine-specific paths:

```lua
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = ""
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
vim.keymap.set("n", "<leader>xx", "<cmd>echo 'hello'<cr>", { desc = "Example" })
```
