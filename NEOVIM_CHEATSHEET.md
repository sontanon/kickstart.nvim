# Neovim Cheatsheet

> **Leader key:** `Space`. When you see `<leader>f`, press `Space` then `f`.
> Press `<leader>` and wait — `which-key` will show all available bindings.

## File Navigation

| Key | Action | Plugin |
|---|---|---|
| `<leader>sf` | Find files | `telescope` |
| `<leader>sg` | Live grep (search all files) | `telescope` |
| `<leader>sw` | Search word under cursor | `telescope` |
| `<leader>s/` | Live grep in open buffers | `telescope` |
| `<leader>sr` | Resume last search | `telescope` |
| `<leader>s.` | Recent files | `telescope` |
| `<leader><leader>` | List open buffers | `telescope` |
| `<leader>/` | Fuzzy search in current buffer | `telescope` |
| `\` | Toggle file tree | `neo-tree` |
| `<leader>sn` | Search neovim config files | `telescope` |

## LSP — Code Intelligence

| Key | Action |
|---|---|
| `grd` | Go to definition (`<C-t>` to jump back) |
| `grr` | Find references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grD` | Go to declaration |
| `grn` | Rename symbol |
| `gra` | Code actions |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover documentation |
| `<leader>th` | Toggle inlay hints |
| `<leader>q` | Open diagnostics quickfix list |
| `]d` / `[d` | Next / previous diagnostic |

## Formatting & Linting (Python / Go / Lua)

- **Format on save** is automatic — Ruff for Python, stylua for Lua.
- **Manual format:** `<leader>f`
- Python imports are auto-organized on save via `ruff_organize_imports`.
- Type checking is handled by `ty` (Astral), visible as inline diagnostics.
- Go linting runs via `golangci-lint` on write.

## Git

| Key | Action | Plugin |
|---|---|---|
| `<leader>gg` | Open Neogit (Git UI) | `neogit` |
| `]c` / `[c` | Next / previous hunk | `gitsigns` |
| `<leader>hs` | Stage hunk | `gitsigns` |
| `<leader>hr` | Reset hunk | `gitsigns` |
| `<leader>hS` | Stage entire buffer | `gitsigns` |
| `<leader>hp` | Preview hunk | `gitsigns` |
| `<leader>hb` | Blame line | `gitsigns` |
| `<leader>hd` | Diff against index | `gitsigns` |
| `<leader>tb` | Toggle line blame | `gitsigns` |

## Debugging (DAP)

Supports Go (delve) and Python (debugpy). Can read `.vscode/launch.json`.

| Key | Action |
|---|---|
| `<F5>` | Start / continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle debug UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

## Text Objects & Surroundings (mini.nvim)

| Key | Action |
|---|---|
| `ci'` | Change inside single quotes |
| `ca)` | Change around parentheses |
| `ds"` | Delete surrounding double quotes |
| `saiw)` | Surround word with parentheses |
| `daf` | Delete around function |
| `ciq` | Change inside any quote |

## Tmux / Pane Navigation

| Key | Action |
|---|---|
| `C-h/j/k/l` | Move between tmux panes and nvim splits seamlessly |

## Miscellaneous

| Key | Action |
|---|---|
| `<Esc>` (normal) | Clear search highlight |
| `<Esc><Esc>` (terminal) | Exit terminal mode |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sd` | Search diagnostics |
| `<leader>ss` | Telescope picker list |
