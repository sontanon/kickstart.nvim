# Neovim Migration Cheatsheet for VSCode Users

This guide translates VSCode habits into the Neovim way of doing things, based on the plugins configured in this repo.

> **The Leader Key:** In Neovim, the `<leader>` key is a special key used to prefix many custom shortcuts. Your configuration sets it to the **`Space`** bar. So, when you see `<leader>f`, it means "press `Space` then `f`".

## The Essentials: VSCode -> Neovim

| Feature | VSCode Shortcut | Neovim Shortcut | Plugin |
| :--- | :--- | :--- | :--- |
| **Command Palette** | `Ctrl+Shift+P` | `<leader>ss` (Search Select) | `telescope.nvim` |
| **File Explorer** | `Ctrl+Shift+E` | `\` (toggle) | `neo-tree.nvim` |
| **Go to File** | `Ctrl+P` | `<leader>sf` | `telescope.nvim` |
| **Global Search** | `Ctrl+Shift+F` | `<leader>sg` | `telescope.nvim` |
| **Toggle Terminal** | `Ctrl+\`` | `<leader>tt` | `toggleterm.nvim` |

## Code Editing & Navigation

Your setup uses the Language Server Protocol (LSP) for code intelligence, just like VSCode.

| Feature | VSCode Action | Neovim Keymap | Notes |
| :--- | :--- | :--- | :--- |
| **Go to Definition** | `F12` | `grd` | Press `<C-t>` to jump back. |
| **Find References** | `Shift+F12` | `grr` | Results appear in a searchable list. |
| **Show Hover/Docs** | Mouse Hover | `K` (in Normal Mode) | Shows a floating window with docs/types. |
| **Rename Symbol** | `F2` | `grn` | Renames the symbol across your project. |
| **Code Actions** | `Ctrl+.` | `gra` | Shows available fixes and refactors. |
| **Go to Type Def** | (via menu) | `grt` | Jumps to the definition of the symbol's type. |
| **Inlay Hints** | (Enabled by default) | `<leader>th` | Toggles on/off extra info like parameter names. |
| **Signature Help** | (Automatic) | `<c-k>` (in Insert Mode) | Manually trigger function signature help. |

## Formatting & Linting (with Ruff)

Your configuration automates most of this, providing a seamless experience.

-   **Format Document (`Shift+Alt+F`):**
    -   **Neovim:** This happens **automatically on save**.
    -   To trigger it manually, press `<leader>f`.
-   **Organize Imports & Auto-Fix:**
    -   **Neovim:** This also happens **automatically on save**, right before formatting. The `ruff_fix` command organizes imports and fixes all other safe linting issues it can find.

## Debugging

Your debugger (`nvim-dap`) is designed to feel familiar and can even use VSCode's `.vscode/launch.json` files.

| Feature | VSCode Key | Neovim Key |
| :--- | :--- | :--- |
| **Start / Continue** | `F5` | `<F5>` |
| **Toggle Breakpoint** | `F9` | `<leader>b` |
| **Step Over** | `F10` | `<F2>` |
| **Step Into** | `F11` | `<F1>` |
| **Step Out** | `Shift+F11` | `<F3>` |
| **Toggle Debug UI** | (Debug Icon) | `<F7>` |

## Jupyter Notebooks (`molten-nvim`)

This provides an interactive, cell-based workflow inside any Python script.

1.  **Define Cells:** Use `# %%` or `##` in a Python script to mark where cells begin.
2.  **Initialize Kernel:** Press `<leader>mi` to start the Jupyter kernel.
3.  **Run a Cell:** Press `<leader>mr` to execute the cell your cursor is in.
4.  **Run All Cells:** Press `<leader>mR`.
5.  **Show Output:** Press `<leader>mo` to view the output/plot window if you've closed it.

## GitHub Copilot

Your setup uses a combination of two plugins for a full Copilot experience: `copilot.vim` for completions and `CopilotChat.nvim` for chat and agent-like features.

### 1. First-Time Setup: Authentication

The core `copilot.vim` plugin handles authentication. You only need to do this once.

1.  Restart Neovim. The new plugins will be installed.
2.  Run the command `:Copilot auth`.
3.  Copilot will give you a code to enter on GitHub's device activation page.
4.  Follow the browser instructions to complete authentication.

### 2. Workflow & Keymaps

#### Inline Completions (from `copilot.vim`)

-   **Automatic Suggestions:** As you type, Copilot will provide suggestions as "ghost text".
-   **Accept Suggestion:** Press `<Tab>` to accept the current suggestion.
-   **Cycle Suggestions:** Use `Alt+]` and `Alt+[` to cycle between different suggestions.

#### Chat & Agent Features (from `CopilotChat.nvim`)

-   **`<leader>cc`**: **C**opilot **C**hat. Opens a chat window to ask questions.
-   **`<leader>ce`**: **C**opilot **E**xplain. Asks Copilot to explain the selected code.
-   **`<leader>cf`**: **C**opilot **F**ix. Asks Copilot to suggest a fix for the selected code or diagnostics under the cursor.

## General Neovim Tips

-   **Which-Key Is Your Friend:** Press `<leader>` (Space) and wait a moment. A menu will pop up showing you all the available keymaps. This is the best way to discover new features.
-   **Efficient Text Editing:** Your setup includes `mini.nvim`, which enhances text manipulation. Try these in normal mode:
    -   `ci'` -> **C**hange **I**nside single quotes.
    -   `ca)` -> **C**hange **A**round parentheses.
    -   `ds"` -> **D**elete **S**urrounding double quotes.
    -   `saiw)` -> **S**urround **A**dd **I**nner **W**ord with `)`.
-   **Navigating the Terminal:** When inside the toggle terminal, you are in "terminal mode". To get back to Neovim's "normal mode" to use commands, press `<Esc><Esc>`. You can then hide the terminal with `<leader>tt`.
