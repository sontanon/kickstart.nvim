# Personal Neovim + Tmux Config

Personal Neovim and tmux configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
Tuned for software development and data science work (Python, Go, Rust, Lua) on macOS and Linux.

## Prerequisites

- **Neovim 0.12+** — This config uses built-in Treesitter highlighting/indent and modern LSP APIs that require 0.12.
- **Git**
- **Make** — Required to build Telescope's fzf-native extension.
- **ripgrep (`rg`)** — Used by Telescope for live grep and fast file searching.
- **fd (`fd` on macOS, `fd-find` on Linux)** — Used by Telescope for file finding.
- **tree-sitter-cli 0.26.1+** — Required by `nvim-treesitter` (main branch) to compile parsers.
  - **Do NOT use apt** — Ubuntu/Debian repositories ship an outdated version (0.20.x).
  - **Recommended:** Download the [official release binary](https://github.com/tree-sitter/tree-sitter/releases/latest) to `~/.local/bin`.
  - **macOS:** `brew install tree-sitter` (usually up to date).
  - **Fedora:** `sudo dnf install tree-sitter-cli` (check `tree-sitter --version` ≥ 0.26.1).
  - **Or via cargo:** `cargo install --locked tree-sitter-cli` (requires `libclang-dev` / `clang-devel`).
- **A [Nerd Font](https://www.nerdfonts.com/)** — Required for icons. Set one in your terminal emulator.
- **Clipboard provider (Linux only)** — Required for OS clipboard integration (`unnamedplus`).
  - X11: `xclip` or `xsel`
  - Wayland: `wl-clipboard`

Install the base packages via your package manager:

```bash
# macOS
brew install neovim tmux git ripgrep fd make tree-sitter

# Fedora
sudo dnf install -y neovim tmux git ripgrep fd-find make gcc unzip xclip
# Then install tree-sitter-cli (verify version ≥ 0.26.1):
# sudo dnf install tree-sitter-cli   # or download from GitHub releases

# Ubuntu/Debian/Pop!_OS
sudo apt update && sudo apt install -y neovim tmux git ripgrep fd-find make gcc unzip xclip
# Then download the official tree-sitter-cli binary (apt is too old):
curl -LO https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-cli-linux-x64.zip
unzip tree-sitter-cli-linux-x64.zip -d tree-sitter-tmp
mkdir -p ~/.local/bin && mv tree-sitter-tmp/tree-sitter ~/.local/bin/
rm -rf tree-sitter-tmp tree-sitter-cli-linux-x64.zip
export PATH="$HOME/.local/bin:$PATH"
```

> **Treesitter note:** This config uses the new `nvim-treesitter` **main** branch (the old `master` branch is archived). Neovim 0.12 ships with built-in Treesitter highlighting and indentation. The `nvim-treesitter` plugin is now used **only** for parser installation and queries. Parsers are compiled with the external `tree-sitter-cli` binary. If you see parser errors, ensure `tree-sitter --version` reports 0.26.1+ and run `:TSUpdate` inside Neovim.

## Installation

### Neovim

```bash
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%s) 2>/dev/null

# Clone this repo
git clone https://github.com/sontanon/kickstart.nvim.git ~/.config/nvim

# First launch — lazy.nvim will auto-install all plugins
nvim
```

On first launch, `lazy.nvim` will bootstrap itself and install every plugin. This can take 1–2 minutes. Once complete, restart Neovim.

**Mason** (the LSP/tool manager) will then auto-install language servers and formatters in the background:
- `ruff`, `ty` (Python)
- `gopls` (Go)
- `rust_analyzer` (Rust)
- `lua_ls`, `stylua` (Lua)
- `golangci-lint` (Go linting)
- `delve`, `debugpy` (debuggers)

> **Python `ty`:** This is Astral's extremely fast Python type checker. It is now mature and available through Mason. If Mason warns that it cannot install `ty` on the very first run, restart Neovim once Mason has finished syncing its registry (`:MasonUpdate` runs automatically on first boot).

### Tmux

```bash
# 1. Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 2. Link the config
ln -sf ~/.config/nvim/.tmux.conf ~/.tmux.conf

# 3. Start tmux and install plugins
tmux new -s main
# Inside tmux: press <prefix> + I (capital i) to fetch and install plugins
```

The tmux config is designed to **fail gracefully** if TPM hasn't been installed yet. The catppuccin theme simply won't load until you run step 1 and press `prefix + I`.

After any future changes to `.tmux.conf`, reload without restarting:

```
prefix + r
```

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
| `treesitter` | Parser installation and updates |
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

## Troubleshooting

### "Cannot find executable: rg" or similar on first launch
Make sure `ripgrep`, `fd`, and `make` are installed and on your `$PATH`. Run `:checkhealth` inside Neovim for a full report.

### Tmux shows raw status strings instead of the catppuccin theme
You haven't installed TPM plugins yet. Inside tmux, press `Ctrl-b` then `I` (capital i).

### Mason is uninstalling tools I installed manually
This config auto-prunes Mason packages that aren't in the hardcoded `ensure_installed` list. If you want to manage Mason packages manually, add this **before** the plugin section loads (e.g., in `init.lua` near the top):

```lua
vim.g.disable_mason_prune = true
```

### Clipboard doesn't sync with the OS (Linux)
Install a clipboard provider:
- `xclip` or `xsel` for X11
- `wl-clipboard` for Wayland

Then restart Neovim.

### Treesitter parser errors or "tree-sitter-cli not found"
1. Check `tree-sitter --version`. **Ubuntu/Debian apt ships 0.20.x — too old.** You need 0.26.1+.
2. Install the [official binary](https://github.com/tree-sitter/tree-sitter/releases/latest) to `~/.local/bin` or use `brew` / `cargo`.
3. Run `:checkhealth nvim-treesitter` to confirm the CLI is detected.
4. Run `:TSUpdate` inside Neovim.

If you were using an older version of this config on the archived `master` branch of `nvim-treesitter`, delete the old plugin folder so lazy.nvim can switch to `main`:

```bash
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter
```

Then restart Neovim.

## Customization

- **Custom plugins:** Add them to `lua/custom/plugins/init.lua` (or create more files under `lua/custom/plugins/`).
- **Mason opt-out:** Set `vim.g.disable_mason_prune = true` to stop automatic pruning.
- **Colorscheme:** Change the `flavour` in the `catppuccin` setup block inside `init.lua`.

## License

This config is derived from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and retains the same MIT license. See [LICENSE.md](LICENSE.md).
