# Neovim Configuration

[한국어](./README.ko.md)

A production-ready Neovim configuration for full-stack developers. This setup provides a complete IDE-like experience with LSP support, autocompletion, debugging, Git integration, and AI assistance.

## Features

- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) with lazy loading for fast startup
- **Theme**: [Dracula](https://github.com/dracula/vim) (default), [Catppuccin](https://github.com/catppuccin/nvim) (Frappe variant)
- **LSP Support**: 15 language servers with auto-installation via Mason
- **Autocompletion**: nvim-cmp with LSP, buffer, path, and snippet sources
- **Formatting**: conform.nvim with format-on-save
- **Linting**: nvim-lint with automatic linting on save
- **Debugging**: DAP support for Python, Go, and JavaScript
- **Git Integration**: gitsigns, vim-fugitive, and lazygit
- **AI Integration**: Claude Code support via claudecode.nvim
- **Dual Environment**: Works in both pure Neovim and VSCode Neovim extension

## Requirements

### Required

| Dependency                                       | Description                           |
| ------------------------------------------------ | ------------------------------------- |
| [Neovim](https://neovim.io/) >= 0.12             | Text editor                           |
| [Git](https://git-scm.com/)                      | Version control                       |
| [Node.js](https://nodejs.org/) >= 18             | Required for many LSP servers         |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast search (for Telescope live grep) |
| [fd](https://github.com/sharkdp/fd)              | Fast file finder (for Telescope)      |
| [Nerd Font](https://www.nerdfonts.com/)          | Icons support                         |

### Language-Specific

| Language | Requirements                                                |
| -------- | ----------------------------------------------------------- |
| Go       | `go` (gopls, gofumpt, goimports installed via Mason)        |
| Python   | `python3` (basedpyright, ruff, debugpy installed via Mason) |
| Lua      | None (lua_ls installed via Mason)                           |

### Other Tools

| Tool                                                | Purpose        | Installation                               |
| --------------------------------------------------- | -------------- | ------------------------------------------ |
| [Claude Code](https://claude.ai/download)           | AI assistant   | `npm install -g @anthropic-ai/claude-code` |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI        | `brew install lazygit`                     |
| [htop](https://htop.dev/)                           | Process viewer | `brew install htop`                        |

### External Tools

Formatters and linters require manual installation. See [docs/external-tools.md](./docs/external-tools.md) for the full list and installation instructions.

## Installation

1. **Backup existing configuration** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this repository**:

   ```bash
   git clone https://github.com/hwyncho/neovim-settings.git ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

   Lazy.nvim will automatically install itself and all plugins on first launch.

4. **Install LSP servers**:

   LSP servers are automatically installed via Mason. You can also manually install them:

   ```vim
   :Mason
   ```

## Key Bindings

Leader key is `<Space>`. Press `<leader>` and wait to see available key groups via which-key.

See [docs/key-bindings.md](./docs/key-bindings.md) for the complete list of key bindings with mode information.

### Quick Reference

| Key          | Mode | Description                     |
| ------------ | ---- | ------------------------------- |
| `<leader>e`  | n    | Toggle file explorer (Neo-tree) |
| `<leader>ff` | n    | Find files                      |
| `<leader>fg` | n    | Live grep                       |
| `K`          | n    | Hover information               |
| `gd`         | n    | Go to definition                |
| `<leader>ca` | n, v | Code action                     |
| `<leader>gl` | n    | LazyGit                         |
| `<leader>ac` | n    | Toggle Claude                   |
| `<F5>`       | n    | Debug: Continue                 |
| `<F9>`       | n    | Debug: Toggle breakpoint        |

## Supported Languages

Lua, Python, Go, TypeScript/JavaScript, HTML, CSS, JSON, YAML, Markdown, Shell, Dockerfile, and Docker Compose.

See [docs/supported-languages.md](./docs/supported-languages.md) for detailed information about LSP, formatters, linters, and debuggers for each language.

## License

MIT License
