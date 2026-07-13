# Key Bindings

This document provides a comprehensive list of key bindings in this Neovim configuration.

## Vim Modes

| Mode     | Abbreviation | Description                              |
| -------- | ------------ | ---------------------------------------- |
| Normal   | `n`          | Default mode for navigating and commands |
| Insert   | `i`          | Text input mode                          |
| Visual   | `v`          | Text selection mode                      |
| Terminal | `t`          | Terminal mode inside Neovim              |

## Leader Key

The leader key is set to `<Space>`.

## General

| Key          | Mode | Description |
| ------------ | ---- | ----------- |
| `<leader>qq` | n    | Quit all    |

## Notifications

| Key          | Mode | Description           |
| ------------ | ---- | --------------------- |
| `<leader>nd` | n    | Dismiss notifications |

## Buffers

| Key           | Mode | Description            |
| ------------- | ---- | ---------------------- |
| `<S-l>`       | n    | Next buffer            |
| `<S-h>`       | n    | Previous buffer        |
| `<leader>bp`  | n    | Pin/Unpin buffer       |
| `<leader>bs`  | n    | Pick buffer            |
| `<leader>bx`  | n    | Pick & close buffer    |
| `<leader>bmn` | n    | Move buffer right      |
| `<leader>bmp` | n    | Move buffer left       |
| `<leader>bd`  | n    | Delete buffer          |
| `<leader>bD`  | n    | Delete buffer (force)  |
| `<leader>bl`  | n    | Close buffers to left  |
| `<leader>br`  | n    | Close buffers to right |

## Navigation

### File Explorer

| Key         | Mode | Description                     |
| ----------- | ---- | ------------------------------- |
| `<leader>e` | n    | Toggle file explorer (Neo-tree) |
| `-`         | n    | Open Oil file browser           |
| `<leader>-` | n    | Open Oil file browser (float)   |

### Telescope

| Key          | Mode | Description    |
| ------------ | ---- | -------------- |
| `<leader>ff` | n    | Find files     |
| `<leader>fg` | n    | Live grep      |
| `<leader>fb` | n    | Find buffers   |
| `<leader>fh` | n    | Help tags      |
| `<leader>fr` | n    | LSP references |

### Trouble

| Key          | Mode | Description          |
| ------------ | ---- | -------------------- |
| `<leader>xx` | n    | Diagnostics          |
| `<leader>xX` | n    | Diagnostics (buffer) |
| `<leader>xs` | n    | Symbols              |
| `<leader>xl` | n    | LSP                  |
| `<leader>xL` | n    | Location List        |
| `<leader>xQ` | n    | Quickfix List        |

## LSP

| Key          | Mode | Description          |
| ------------ | ---- | -------------------- |
| `K`          | n    | Hover information    |
| `gd`         | n    | Go to definition     |
| `gD`         | n    | Go to declaration    |
| `gI`         | n    | Go to implementation |
| `<leader>rn` | n    | Rename symbol        |
| `<leader>ca` | n, v | Code action          |

## Diagnostics

| Key          | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<leader>dl` | n    | Line diagnostics    |
| `<leader>dp` | n    | Previous diagnostic |
| `<leader>dn` | n    | Next diagnostic     |

## Formatting

| Key          | Mode | Description           |
| ------------ | ---- | --------------------- |
| `<leader>F`  | n, v | Format buffer         |
| `<leader>uf` | n    | Toggle format-on-save |

## Git

| Key          | Mode | Description |
| ------------ | ---- | ----------- |
| `<leader>gs` | n    | Git status  |
| `<leader>gc` | n    | Git commit  |
| `<leader>gp` | n    | Git push    |
| `<leader>gP` | n    | Git pull    |
| `<leader>gb` | n    | Git blame   |
| `<leader>gd` | n    | Git diff    |
| `<leader>gl` | n    | LazyGit     |

## Terminal

### Opening Terminals

| Key          | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<C-\>`      | n    | Toggle terminal     |
| `<leader>tf` | n    | Floating terminal   |
| `<leader>th` | n    | Horizontal terminal |
| `<leader>tv` | n    | Vertical terminal   |
| `<leader>tp` | n    | Python REPL         |
| `<leader>tn` | n    | Node REPL           |
| `<leader>tt` | n    | Htop                |

### Inside Terminal

| Key     | Mode | Description           |
| ------- | ---- | --------------------- |
| `<Esc>` | t    | Exit terminal mode    |
| `jk`    | t    | Exit terminal mode    |
| `<C-h>` | t    | Move to left window   |
| `<C-j>` | t    | Move to bottom window |
| `<C-k>` | t    | Move to top window    |
| `<C-l>` | t    | Move to right window  |

## Debugging (DAP)

| Key         | Mode | Description       |
| ----------- | ---- | ----------------- |
| `<F5>`      | n    | Continue          |
| `<F9>`      | n    | Toggle breakpoint |
| `<F10>`     | n    | Step over         |
| `<F11>`     | n    | Step into         |
| `<F12>`     | n    | Step out          |
| `<leader>D` | n    | Toggle DAP UI     |

## AI (Claude Code)

| Key          | Mode | Description              |
| ------------ | ---- | ------------------------ |
| `<leader>ac` | n    | Toggle Claude            |
| `<leader>af` | n    | Focus Claude             |
| `<leader>ar` | n    | Resume Claude            |
| `<leader>aC` | n    | Continue Claude          |
| `<leader>am` | n    | Select Claude model      |
| `<leader>ab` | n    | Add current buffer       |
| `<leader>as` | v    | Send selection to Claude |
| `<leader>aa` | n    | Accept diff              |
| `<leader>ad` | n    | Deny diff                |

## Editing (Plugin-based)

### Comment.nvim

| Key   | Mode | Description          |
| ----- | ---- | -------------------- |
| `gcc` | n    | Toggle line comment  |
| `gbc` | n    | Toggle block comment |
| `gc`  | v    | Toggle line comment  |
| `gb`  | v    | Toggle block comment |

### nvim-surround

| Key                | Mode | Description                  |
| ------------------ | ---- | ---------------------------- |
| `ys{motion}{char}` | n    | Add surrounding              |
| `ds{char}`         | n    | Delete surrounding           |
| `cs{old}{new}`     | n    | Change surrounding           |
| `S{char}`          | v    | Add surrounding to selection |

### Treesitter Text Objects

| Key  | Mode | Description             |
| ---- | ---- | ----------------------- |
| `af` | v, o | Select outer function   |
| `if` | v, o | Select inner function   |
| `ac` | v, o | Select outer class      |
| `ic` | v, o | Select inner class      |
| `aa` | v, o | Select outer parameter  |
| `ia` | v, o | Select inner parameter  |
| `]m` | n    | Next function start     |
| `[m` | n    | Previous function start |
| `]]` | n    | Next class start        |
| `[[` | n    | Previous class start    |

### Incremental Selection

| Key         | Mode | Description              |
| ----------- | ---- | ------------------------ |
| `<C-Space>` | n    | Start incremental select |
| `<C-Space>` | v    | Expand selection         |
| `<BS>`      | v    | Shrink selection         |

## Which-Key Groups

Press `<leader>` and wait to see available key groups:

| Prefix      | Group         |
| ----------- | ------------- |
| `<leader>a` | AI            |
| `<leader>b` | Buffer        |
| `<leader>d` | Diagnostics   |
| `<leader>f` | Telescope     |
| `<leader>g` | Git           |
| `<leader>n` | Notifications |
| `<leader>t` | Terminal      |
| `<leader>x` | Trouble       |
