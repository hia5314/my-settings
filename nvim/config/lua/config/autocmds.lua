local aug = vim.api.nvim_create_augroup

-- ============================================================================
-- Common Autocmds
-- ============================================================================

-- Briefly highlight after yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = aug("YankHighlight", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

-- ============================================================================
-- Neovim-only Autocmds
-- ============================================================================
if not vim.g.vscode then
    -- Improve wrapping and readability in Markdown files
    vim.api.nvim_create_autocmd("FileType", {
        group = aug("MarkdownSettings", { clear = true }),
        pattern = { "markdown" },
        callback = function()
            vim.opt_local.wrap = true -- Enable soft wrapping for long lines
            vim.opt_local.linebreak = true -- Wrap at word boundaries
        end,
    })

    -- Stop yamlls LSP server for Helm templates (prevent conflicts)
    vim.api.nvim_create_autocmd("FileType", {
        group = aug("HelmAndYamlls", { clear = true }),
        pattern = "helm",
        callback = function()
            vim.defer_fn(function() vim.lsp.enable("yamlls", false) end, 100)
        end,
    })

    -- Set dotenv filetype for .env files (so linters/formatters recognize it)
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = aug("DotenvFiletype", { clear = true }),
        pattern = { ".env", ".env.*", "*.env" },
        callback = function() vim.bo.filetype = "dotenv" end,
    })

    -- Add a keymap in file explorers to add files to Claude
    vim.api.nvim_create_autocmd("FileType", {
        group = aug("ClaudeCodeFileExplorer", { clear = true }),
        pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        callback = function()
            vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { desc = "Add file to Claude", buf = 0 })
        end,
    })
end
