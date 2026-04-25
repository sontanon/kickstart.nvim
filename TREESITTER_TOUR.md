# Neovim 0.12 Treesitter Interactive Feature Tour

> Date: April 25, 2026 | Neovim: 0.12.1 | tree-sitter-cli: 0.26.8

---

## Recent Changes Made to Your Config

1. **Fixed `mini.ai` conflict** — it was intercepting `a`/`i` in visual mode, breaking built-in `v_an`/`v_in`. Remapped mini.ai to `aa`/`ii`.
2. **Added `nvim-treesitter-textobjects`** — proper function/class/struct text objects (`af`, `if`, `ac`, `ic`, etc.).
3. **Enabled folds** with `foldlevel=99` (everything starts unfolded).

---

## Sample Files (for practicing)

```bash
nvim treesitter-test/main.py
nvim treesitter-test/main.rs
nvim treesitter-test/main.go
```

---

## 1. Syntax Highlighting

Treesitter provides **semantic highlighting** — it understands the AST, not just regex patterns.

**Try:** Place cursor on any symbol and run:

```vim
:Inspect
```

Shows the EXACT treesitter capture group (`@function`, `@type`, `@keyword`, etc.).

---

## 2. Text Objects: Select Function, Class, Struct, Block

These are now powered by `nvim-treesitter-textobjects`. Works in **Visual** and **Operator-pending** modes (`x` and `o`).

### Function / Method Selection

| Mapping | Action |
|---------|--------|
| `af` | **A**round **F**unction (select entire function including signature) |
| `if` | **I**nside **F**unction (select only function body) |
| `am` | **A**round **M**ethod (alias for `af`) |
| `im` | **I**nside **M**ethod (alias for `if`) |

**Try in `main.go`:** Place cursor inside `NewUserService`, press `vaf` — the entire function is selected. Press `vif` — only the body inside `{}` is selected.

### Class / Struct / Type Selection

| Mapping | Action |
|---------|--------|
| `ac` | **A**round **C**lass/struct/type |
| `ic` | **I**nside **C**lass/struct/type |

**Try in `main.go`:** Place cursor on `type User struct`, press `vac` — the entire struct definition is selected.

### Block Selection

| Mapping | Action |
|---------|--------|
| `ab` | **A**round **B**lock (loop, if, etc.) |
| `ib` | **I**nside **B**lock |

### Argument / Parameter Selection

| Mapping | Action |
|---------|--------|
| `aa` | **A**round **A**rgument |
| `ia` | **I**nside **A**rgument |

### Conditional Selection

| Mapping | Action |
|---------|--------|
| `ai` | **A**round **I**f/conditional |
| `ii` | **I**nside **I**f/conditional |

### How It Works

These work just like built-in Vim text objects (`iw`, `ap`, `i"`, etc.):
- `vaf` — visual select around function
- `daf` — delete around function
- `yif` — yank inside function
- `cic` — change inside class
- `>ab` — indent around block

---

## 3. Movements: Jump Between Functions and Classes

Navigate like `]m`/`[m` in Vim, but treesitter-aware:

| Mapping | Action |
|---------|--------|
| `]m` | Jump to **next** function start |
| `]M` | Jump to **next** function end |
| `[m` | Jump to **previous** function start |
| `[M` | Jump to **previous** function end |
| `]]` | Jump to **next** class/struct start |
| `][` | Jump to **next** class/struct end |
| `[[` | Jump to **previous** class/struct start |
| `[]` | Jump to **previous** class/struct end |

**Try in `main.go`:** Press `]m` repeatedly to jump through all functions.

---

## 4. Built-in Incremental Selection (`v_an` / `v_in`)

Neovim 0.12 has **built-in** incremental selection that expands/shrinks by AST node. Now that `mini.ai` conflict is fixed, these work:

In **Visual mode**:

| Mapping | Action |
|---------|--------|
| `an` | **A**round **N**ode — expand selection outward |
| `in` | **I**nside **N**ode — shrink selection inward |
| `]n` | Expand to next sibling node |
| `[n` | Expand to previous sibling node |

**How it differs from text objects:**
- `vaf` → selects the **entire function** in one jump
- `van` → expands **node by node**: variable → expression → statement → block → function

**Try in `main.py`:**
1. Place cursor on `user` inside `repo.save(user)`
2. Press `v` then `an` — expands to `repo.save(user)`
3. Press `an` again — expands to the whole line
4. Press `an` again — expands to the `for` loop body
5. Press `an` again — expands to the entire `for` loop
6. Press `in` — shrinks back down

---

## 5. Folds

Treesitter folds are **AST-aware**.

| Command | Action |
|---------|--------|
| `zo` | Open fold under cursor |
| `zc` | Close fold under cursor |
| `za` | Toggle fold |
| `zM` | Close ALL folds |
| `zR` | Open ALL folds |
| `zj` / `zk` | Next / previous fold |

Files open with everything **unfolded** (`foldlevel=99`).

**Try:** Open `main.py`, run `zM` — functions/classes collapse. `zo` to expand one.

---

## 6. Tree Inspector (`:InspectTree`)

See the actual AST:

```vim
:InspectTree
```

| Key | Action |
|-----|--------|
| `<CR>` | Jump to node in source |
| `o` | Toggle node collapse |
| `a` | Toggle anonymous nodes |
| `I` | Toggle language injections |
| `q` | Close |

---

## 7. Language Injections

Embedded languages are automatically highlighted:
- Python f-strings: `f"Hello {user.name}"`
- Markdown code blocks: ` ```python ... ``` `
- HTML inside strings/templates
- Regex inside `r"..."` strings

---

## 8. Health Check

```vim
:checkhealth nvim-treesitter
```

---

## 9. What Changed vs. Old nvim-treesitter

| Old Way (pre-0.12) | New Way (0.12+) |
|-------------------|-----------------|
| `require('nvim-treesitter.configs').setup(...)` | `require('nvim-treesitter').install(...)` |
| Auto-highlighting on `highlight = { enable = true }` | Manual `vim.treesitter.start()` per filetype |
| `nvim-treesitter-textobjects` with `.setup({ select = ... })` | Manual keymaps calling `select_textobject()` |
| `nvim-treesitter` `master` branch | `nvim-treesitter` `main` branch (rewrite) |
| Plugin-managed folds | `vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'` |

---

## Quick Test Checklist

Open `main.go` and verify:

- [ ] `:Inspect` shows capture groups
- [ ] `zM` closes folds, `zR` opens them
- [ ] Place cursor in `NewUserService`, `vaf` selects entire function
- [ ] `vif` selects only the body
- [ ] Place cursor on `type User struct`, `vac` selects entire struct
- [ ] `]m` jumps to next function
- [ ] `v` + `an` expands selection node by node
- [ ] `v` + `in` shrinks selection
- [ ] `:InspectTree` shows the AST

---

*Generated on April 25, 2026 for kickstart.nvim + Neovim 0.12.1*
