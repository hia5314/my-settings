return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = function()
            local conform = require "conform"
            return {
                notify_on_error = false,
                format_on_save = function(bufnr)
                    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                        return nil
                    end
                    local max = 200 * 1024
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
                    if ok and stats and stats.size > max then
                        return nil
                    end
                    return { timeout_ms = 800, lsp_format = "fallback" }
                end,
                -- format_on_save = nil,
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = function(bufnr)
                        if conform.get_formatter_info("ruff_format", bufnr).available then
                            return { "ruff_organize_imports", "ruff_format" }
                        else
                            return { "isort", "black" }
                        end
                    end,
                    go = { "gofumpt", "goimports" },
                    yaml = { "prettierd", "prettier", "yamlfmt", stop_after_first = true },
                    json = { "biome", "prettierd", "prettier", stop_after_first = true },
                    html = { "prettierd", "prettier", stop_after_first = true },
                    css = { "prettierd", "prettier", stop_after_first = true },
                    javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
                    typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
                    markdown = { "prettierd", "prettier", "mdformat", stop_after_first = true },
                    java = { "google-java-format" },
                    kotlin = { "ktlint" },
                    sh = { "shfmt" },
                    dockerfile = {},
                },
            }
        end,
    },
}
