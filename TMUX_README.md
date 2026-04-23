# Tmux Setup

## Prerequisites

- **tmux** installed via your package manager.
- **Git** (to clone TPM).

## Installation

### 1. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 2. Link the config

```bash
ln -sf ~/.config/nvim/.tmux.conf ~/.tmux.conf
```

> If your Neovim config lives somewhere other than `~/.config/nvim`, adjust the source path above.

### 3. Start tmux and install plugins

```bash
tmux new -s main
```

Inside tmux, press `prefix + I` (capital **I**) to fetch and install all plugins. You should see a status message listing the installed plugins.

> **Why this step matters:** The config is designed to fail gracefully if TPM hasn't been installed yet. The catppuccin theme simply won't load, so the status bar may look plain until you run this step.

### 4. Reload config after future changes

After editing `.tmux.conf`, reload without restarting tmux:

```
prefix + r
```

---

## Quick Reference

### Sessions & Windows

| Command | Description |
|---|---|
| `tmux new -s <name>` | Create a new named session |
| `tmux ls` | List sessions |
| `tmux a -t <name>` | Attach to a session |
| `prefix + d` | Detach |
| `prefix + c` | New window |
| `prefix + ,` | Rename window |
| `prefix + w` | List windows |
| `prefix + n` / `p` | Next / previous window |
| `prefix + &` | Kill window |

### Panes

| Key | Description |
|---|---|
| `prefix + \| ` | Split vertically (opens in current directory) |
| `prefix + -` | Split horizontally (opens in current directory) |
| `prefix + x` | Kill pane |
| `prefix + z` | Zoom pane |
| `C-h/j/k/l` | Navigate panes (tmux + Neovim aware) |
| `Alt + l` | Clear screen (`C-l` is taken by the navigator) |

### Copy Mode (vi keys)

| Key | Description |
|---|---|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `V` | Select line |
| `y` | Copy to system clipboard (pbcopy on macOS, xclip on Linux) |
| `q` | Quit copy mode |

### Other

| Key | Description |
|---|---|
| `prefix + r` | Reload config |
| `prefix + I` | Install plugins (TPM) |
