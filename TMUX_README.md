# TMUX Setup Instructions

This document outlines the steps to set up the custom tmux configuration in this repository.

## 1. Create a Symbolic Link

First, create a symbolic link from this `.tmux.conf` file to your home directory. This will make it your active tmux configuration.

```bash
ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf
```

## 2. Install Tmux Plugin Manager (tpm)

This configuration uses `tpm` to manage tmux plugins. If you don't have `tpm` installed, clone its repository:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## 3. Install Plugins

After setting up the symbolic link and `tpm`, you need to install the plugins defined in `.tmux.conf`.

1.  Start a new tmux session by running `tmux` in your terminal.
2.  Once inside tmux, press your `prefix` key (default is `Ctrl-b`) followed by `I` (capital `I`). This will fetch and install all the plugins.

## 4. Reload Configuration (Optional)

If you make changes to `.tmux.conf` or want to reload the configuration, you can do so within a tmux session by pressing `prefix` (default `Ctrl-b`) followed by `r`.

## QUICK REFERENCE

### General Commands

| Command | Description |
|---|---|
| `tmux new -s <name>` | Create a new named session |
| `tmux ls` | List all running sessions |
| `tmux a -t <name>` | Attach to a named session |
| `prefix + d` | Detach from the current session |
| `prefix + c` | Create a new window |
| `prefix + ,` | Rename the current window |
| `prefix + w` | List all windows |
| `prefix + p` | Go to the previous window |
| `prefix + n` | Go to the next window |
| `prefix + &` | Kill the current window |
| `prefix + x` | Kill the current pane |
| `prefix + z` | Zoom the current pane |
| `prefix + o` | Go to the next pane |
| `prefix + ;` | Go to the previous pane |

### Custom Configuration Cheat Sheet

| Keybinding | Description |
|---|---|
| `prefix + r` | Reload the tmux configuration file |
| `prefix + |` | Split the current pane vertically |
| `prefix + -` | Split the current pane horizontally |
| `Ctrl + h` | Navigate to the pane on the left |
| `Ctrl + j` | Navigate to the pane below |
| `Ctrl + k` | Navigate to the pane above |
| `Ctrl + l` | Navigate to the pane on the right |
| `Alt + l` | Clear the screen |

#### Copy Mode (vi-keys)

| Keybinding | Description |
|---|---|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `V` | Select the entire line |
| `y` | Copy the selection to the system clipboard |
| `q` | Quit copy mode |
