# Personal Neovim + Tmux Config

Personal Neovim and tmux configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
Tuned for software development and data science work (Python, Go, Rust, Lua) on macOS and Linux.

## Prerequisites

Install via Homebrew (macOS) or your distro's package manager:

```bash
# macOS
brew install neovim tmux git ripgrep fd make

# Fedora
sudo dnf install -y neovim tmux git ripgrep fd-find make gcc unzip
```

A [Nerd Font](https://www.nerdfonts.com/) is required for icons — set one in your terminal emulator.

## Neovim Installation

```bash
git clone <your-fork-url> ~/.config/nvim
nvim  # Lazy will auto-install all plugins on first launch
```

## Tmux Installation

See [TMUX_README.md](TMUX_README.md) for setup steps (tpm install, symlink, plugin bootstrap).

## What's Included

### Neovim Plugins

| Plugin | Role |
|---|---|
| `telescope.nvim` + fzf-native | Fuzzy find files, grep, buffers, LSP symbols |
| `nvim-lspconfig` + Mason | LSP for Python (`ruff`, `ty`), Go (`gopls`), Rust (`rust_analyzer`), Lua |
| `conform.nvim` | Format on save — Ruff for Python, stylua for Lua |
| `nvim-lint` | Go linting via `golangci-lint` (Mason-managed) |
| `blink.cmp` + LuaSnip | Completion with community snippets via `friendly-snippets` |
| `nvim-dap` + dap-ui | Debugger for Go (delve) and Python (debugpy) |
| `neo-tree.nvim` | File browser sidebar |
| `gitsigns.nvim` | Git hunk signs, staging, blame |
| `neogit` + `diffview` | Magit-style Git UI and diff viewer |
| `vim-tmux-navigator` | Seamless navigation across tmux panes and nvim splits |
| `catppuccin` (macchiato) | Colorscheme |
| `treesitter` | Syntax highlighting and smart indentation |
| `which-key.nvim` | Keybinding popup helper |
| `mini.ai` / `mini.surround` | Enhanced text objects and surround operations |
| `render-markdown.nvim` | In-buffer markdown rendering |
| `todo-comments.nvim` | Highlights TODO / FIXME / HACK in comments |

### Tmux Plugins

| Plugin | Role |
|---|---|
| `catppuccin/tmux` (v2) | Status bar theme matching Neovim (macchiato) |

## Key Bindings

See [NEOVIM_CHEATSHEET.md](NEOVIM_CHEATSHEET.md) for a full keybinding reference.

**Quick reference:**

| Key | Action |
|---|---|
| `Space` | Leader key |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader><leader>` | List open buffers |
| `<leader>gg` | Open Neogit (Git UI) |
| `<leader>f` | Format buffer |
| `\` | Toggle file tree |
| `grd` | Go to definition |
| `grr` | Find references |
| `grn` | Rename symbol |
| `<leader>b` | Toggle breakpoint |
| `<F5>` | Start / continue debugger |
| `C-h/j/k/l` | Navigate panes (tmux + nvim aware) |
