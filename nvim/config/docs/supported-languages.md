# Supported Languages

This document provides detailed information about language support in this Neovim configuration.

## Overview

| Language              | LSP                             | Formatter            | Linter        | Debugger |
| --------------------- | ------------------------------- | -------------------- | ------------- | -------- |
| Lua                   | lua_ls                          | stylua               | -             | -        |
| Python                | basedpyright, ruff              | ruff / black + isort | ruff          | debugpy  |
| Go                    | gopls                           | gofumpt, goimports   | golangci-lint | delve    |
| TypeScript/JavaScript | ts_ls                           | prettier / biome     | eslint_d      | js-debug |
| HTML                  | html, emmet_ls                  | prettier             | -             | -        |
| CSS                   | cssls                           | prettier             | stylelint     | -        |
| JSON                  | jsonls                          | prettier / biome     | jq            | -        |
| YAML                  | yamlls, helm_ls                 | prettier             | yamllint      | -        |
| Markdown              | marksman                        | prettier             | markdownlint  | -        |
| Shell                 | bashls                          | shfmt                | shellcheck    | -        |
| Dockerfile            | dockerls                        | -                    | hadolint      | -        |
| Java                  | jdtls (nvim-jdtls)              | google-java-format   | -             | java-debug-adapter |
| Kotlin                | kotlin_language_server          | ktlint               | ktlint        | kotlin-debug-adapter |
| Docker Compose        | docker_compose_language_service | -                    | -             | -        |

## Language Details

### Lua

- **LSP**: [lua_ls](https://github.com/LuaLS/lua-language-server) - Lua Language Server with Neovim runtime support
- **Formatter**: [stylua](https://github.com/JohnnyMorganz/StyLua) - Opinionated Lua code formatter
- **Config**: Recognizes `vim` global, includes Neovim runtime files

### Python

- **LSP**: [basedpyright](https://github.com/DetachHead/basedpyright) - Static type checker with enhanced features
- **LSP**: [ruff](https://github.com/astral-sh/ruff) - Fast linter (hover disabled to avoid conflicts)
- **Formatter**: ruff (preferred) or black + isort (fallback)
- **Linter**: ruff
- **Debugger**: [debugpy](https://github.com/microsoft/debugpy) via Mason

### Go

- **LSP**: [gopls](https://github.com/golang/tools/tree/master/gopls) - Official Go language server
- **Formatter**: gofumpt (stricter gofmt) + goimports (import management)
- **Linter**: [golangci-lint](https://golangci-lint.run/) - Meta linter
- **Debugger**: [delve](https://github.com/go-delve/delve) via Mason
- **Config**: staticcheck enabled, unused params analysis

### TypeScript/JavaScript

- **LSP**: [ts_ls](https://github.com/microsoft/TypeScript) - TypeScript Language Server
- **Formatter**: biome (preferred) or prettier/prettierd (fallback)
- **Linter**: [eslint_d](https://github.com/mantoni/eslint_d.js) - Faster ESLint daemon
- **Debugger**: [js-debug](https://github.com/microsoft/vscode-js-debug) via Mason
- **Config**: Inlay hints for return types enabled

### HTML

- **LSP**: [html](https://github.com/microsoft/vscode-html-languageservice) - HTML Language Server
- **LSP**: [emmet_ls](https://github.com/aca/emmet-ls) - Emmet abbreviation support
- **Formatter**: prettier/prettierd

### CSS

- **LSP**: [cssls](https://github.com/microsoft/vscode-css-languageservice) - CSS Language Server
- **Formatter**: prettier/prettierd
- **Linter**: [stylelint](https://stylelint.io/)

### JSON

- **LSP**: [jsonls](https://github.com/microsoft/vscode-json-languageservice) - JSON Language Server with SchemaStore
- **Formatter**: biome (preferred) or prettier/prettierd (fallback)
- **Linter**: [jq](https://jqlang.github.io/jq/) - JSON validator
- **Config**: Schema validation enabled via SchemaStore

### YAML

- **LSP**: [yamlls](https://github.com/redhat-developer/yaml-language-server) - YAML Language Server with SchemaStore
- **LSP**: [helm_ls](https://github.com/mrjosh/helm-ls) - Helm chart support
- **Formatter**: prettier/prettierd or yamlfmt
- **Linter**: [yamllint](https://github.com/adrienverge/yamllint)
- **Config**: Schema validation enabled via SchemaStore

### Markdown

- **LSP**: [marksman](https://github.com/artempyanykh/marksman) - Markdown Language Server
- **Formatter**: prettier/prettierd or mdformat
- **Linter**: [markdownlint](https://github.com/DavidAnson/markdownlint)

### Shell (Bash)

- **LSP**: [bashls](https://github.com/bash-lsp/bash-language-server) - Bash Language Server
- **Formatter**: [shfmt](https://github.com/mvdan/sh)
- **Linter**: [shellcheck](https://www.shellcheck.net/)

### Dockerfile

- **LSP**: [dockerls](https://github.com/rcjsuen/dockerfile-language-server-nodejs) - Dockerfile Language Server
- **Linter**: [hadolint](https://github.com/hadolint/hadolint) - Dockerfile linter

### Docker Compose

- **LSP**: [docker_compose_language_service](https://github.com/microsoft/compose-language-service) - Docker Compose Language Server

### Java

- **LSP**: [jdtls](https://github.com/eclipse-jdtls/eclipse.jdt.ls) via [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) - Eclipse JDT Language Server
- **Formatter**: [google-java-format](https://github.com/google/google-java-format) (preferred), jdtls built-in (fallback)
- **Debugger**: [java-debug-adapter](https://github.com/microsoft/java-debug) + [java-test](https://github.com/microsoft/vscode-java-test) via nvim-jdtls bundles
- **Config**: Separate plugin file (`lang-java.lua`), per-project workspace directory, OS-specific configuration

### Kotlin

- **LSP**: [kotlin_language_server](https://github.com/fwcd/kotlin-language-server) - Kotlin Language Server
- **Formatter**: [ktlint](https://github.com/pinterest/ktlint) - Kotlin linter and formatter
- **Linter**: [ktlint](https://github.com/pinterest/ktlint)
- **Debugger**: [kotlin-debug-adapter](https://github.com/fwcd/kotlin-debug-adapter) via Mason

## Additional File Types

### Helm Templates

- Automatically detected via `vim-helm` plugin
- Uses `helm_ls` with `yamlls` integration
- YAML LSP disabled for `.tpl` files to avoid conflicts

### .env Files

- File type detection enabled
- Linter: [dotenv-linter](https://github.com/dotenv-linter/dotenv-linter)
- Environment variables loaded via `dotenv.nvim`
