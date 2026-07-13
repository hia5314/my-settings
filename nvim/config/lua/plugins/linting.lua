return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local lint = require "lint"
            lint.linters_by_ft = {
                python = { "ruff" },
                go = { "golangcilint" },
                yaml = { "yamllint" },
                json = { "jq" },
                sh = { "shellcheck" },
                dockerfile = { "hadolint" },
                markdown = { "markdownlint" },
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                kotlin = { "ktlint" },
                css = { "stylelint" },
                dotenv = { "dotenv_linter" },
            }
            local group = vim.api.nvim_create_augroup("NvimLint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                group = group,
                callback = function() require("lint").try_lint() end,
            })
        end,
    },
}
