# Keymaps

Leader key is `<Space>`. This file documents all custom and plugin keybindings. Default Vim keymaps are not listed.

## General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>q` | n | Quit |
| `<leader>w` | n | Write |
| `<leader>wq` | n | Write and quit |
| `U` | n | Redo |
| `jj` | i | Exit insert mode |

## Finder (snacks.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | n | Smart find files |
| `<leader>fs` | n | Grep |
| `<leader>fb` | n | Buffers |
| `<leader>e` | n | File explorer |

## LSP

Attached on `LspAttach` -- only available in buffers with an active language server.

| Key | Mode | Action |
|-----|------|--------|
| `K` | n | Hover documentation |
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `go` | n | Go to type definition |
| `gr` | n | References |
| `<leader>ca` | n | Code action |
| `<leader>cr` | n | Rename symbol |
| `<leader>cf` | n, x | Format (conform with LSP fallback) |
| `<leader>cd` | n | Line diagnostics |
| `<leader>cq` | n | Diagnostics to quickfix list |

## Diagnostics (built-in)

These are Neovim 0.11+ built-in mappings, listed here for reference.

| Key | Mode | Action |
|-----|------|--------|
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |

## Completion (blink.cmp)

Uses the `default` preset. Active in insert mode when the completion menu is visible.

| Key | Mode | Action |
|-----|------|--------|
| `C-y` | i | Accept completion |
| `C-n` / `C-p` | i | Next / previous item |
| `C-space` | i | Show completion menu |
| `C-e` | i | Hide menu |
| `C-k` | i | Toggle signature help |
| `C-b` / `C-f` | i | Scroll docs up / down |
| `Tab` / `S-Tab` | i, s | Next / previous snippet field |

## Commenting (built-in)

These are Neovim 0.10+ built-in mappings.

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | n | Toggle comment (line) |
| `gc` | x | Toggle comment (selection) |

## Debugging (nvim-dap)

Requires `Config.dap = true` (default).

| Key | Mode | Action |
|-----|------|--------|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dc` | n | Continue |
| `<leader>dt` | n | Terminate |
| `<leader>do` | n | Step over |
| `<leader>di` | n | Step into |
| `<leader>du` | n | Step out |
| `<leader>dv` | n | Toggle debug UI |

## AI -- Copilot

Requires `Config.copilot = true` (default).

| Key | Mode | Action |
|-----|------|--------|
| `C-a` | i | Accept Copilot suggestion |

## AI -- Avante

Requires `Config.avante = true` (default). These are Avante's built-in defaults.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>aa` | n, v | Ask Avante |
| `<leader>ae` | n, v | Edit with Avante |
| `<leader>ar` | n | Refresh Avante |
| `<leader>at` | n | Toggle Avante sidebar |

## Tmux Navigation

Requires tmux to be running. Works across Neovim splits and tmux panes seamlessly.

| Key | Mode | Action |
|-----|------|--------|
| `C-h` | n | Navigate left |
| `C-j` | n | Navigate down |
| `C-k` | n | Navigate up |
| `C-l` | n | Navigate right |
