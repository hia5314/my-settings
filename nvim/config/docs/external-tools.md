# External Tools

This document lists the external tools used by formatters and linters in this Neovim configuration.

Most tools are **automatically installed** via [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) when Neovim starts. Tools marked with "Mason (auto)" require no manual action. Tools marked with "Manual" must be installed separately.

## Formatters

| Tool                                                             | Languages                               | Installation                 |
| ---------------------------------------------------------------- | --------------------------------------- | ---------------------------- |
| [stylua](https://github.com/JohnnyMorganz/StyLua)                | Lua                                     | Mason (auto)                 |
| [ruff](https://github.com/astral-sh/ruff)                        | Python                                  | Mason (auto, via lspconfig)  |
| [black](https://github.com/psf/black)                            | Python                                  | Mason (auto)                 |
| [isort](https://github.com/PyCQA/isort)                          | Python                                  | Mason (auto)                 |
| [gofumpt](https://github.com/mvdan/gofumpt)                      | Go                                      | Mason (auto)                 |
| [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports) | Go                                      | Mason (auto)                 |
| [prettier](https://prettier.io/)                                 | JS, TS, JSON, YAML, HTML, CSS, Markdown | Mason (auto)                 |
| [prettierd](https://github.com/fsouza/prettierd)                 | Same as prettier (faster)               | Mason (auto)                 |
| [biome](https://biomejs.dev/)                                    | JS, TS, JSON                            | Mason (auto)                 |
| [google-java-format](https://github.com/google/google-java-format) | Java                                    | Mason (auto)                 |
| [ktlint](https://github.com/pinterest/ktlint)                    | Kotlin                                  | Mason (auto)                 |
| [shfmt](https://github.com/mvdan/sh)                             | Shell                                   | Mason (auto)                 |

## Linters

| Tool                                                            | Languages  | Installation                 |
| --------------------------------------------------------------- | ---------- | ---------------------------- |
| [ruff](https://github.com/astral-sh/ruff)                       | Python     | Mason (auto, via lspconfig)  |
| [golangci-lint](https://golangci-lint.run/)                     | Go         | Mason (auto)                 |
| [yamllint](https://github.com/adrienverge/yamllint)             | YAML       | Mason (auto)                 |
| [jq](https://jqlang.github.io/jq/)                              | JSON       | Manual: `brew install jq`    |
| [shellcheck](https://www.shellcheck.net/)                       | Shell      | Mason (auto)                 |
| [hadolint](https://github.com/hadolint/hadolint)                | Dockerfile | Mason (auto)                 |
| [markdownlint](https://github.com/DavidAnson/markdownlint)      | Markdown   | Mason (auto)                 |
| [eslint_d](https://github.com/mantoni/eslint_d.js)              | JS, TS     | Mason (auto)                 |
| [ktlint](https://github.com/pinterest/ktlint)                   | Kotlin     | Mason (auto)                 |
| [stylelint](https://stylelint.io/)                              | CSS        | Mason (auto)                 |
| [dotenv-linter](https://github.com/dotenv-linter/dotenv-linter) | .env files | Manual: `brew install dotenv-linter` |

## Manual Installation

The following tools are not available in Mason and must be installed manually:

```bash
brew install jq dotenv-linter
```
