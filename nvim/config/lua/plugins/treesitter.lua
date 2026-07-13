return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
                callback = function() pcall(vim.treesitter.start) end,
            })

            -- Treesitter-based folding
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.opt.foldenable = false

            -- Incremental selection keymaps (built-in treesitter node text objects)
            local map = vim.keymap.set
            map("n", "<C-space>", "van", { desc = "Init treesitter selection" })
            map("x", "<C-space>", "an", { desc = "Increment treesitter selection" })
            map("x", "<bs>", "in", { desc = "Decrement treesitter selection" })
        end,
    },

    {
        "lewis6991/ts-install.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("ts-install").setup {
                ensure_install = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "python",
                    "go",
                    "javascript",
                    "typescript",
                    "tsx",
                    "bash",
                    "html",
                    "css",
                    "json",
                    "yaml",
                    "toml",
                    "markdown",
                    "markdown_inline",
                    "dockerfile",
                    "java",
                    "kotlin",
                },
                auto_install = true,
            }
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup {
                select = {
                    lookahead = true,
                    selection_modes = {
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "V",
                    },
                },
                move = {
                    set_jumps = true,
                },
            }

            -- Textobject keymaps
            local map = vim.keymap.set
            map(
                { "x", "o" },
                "af",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
                end,
                { desc = "Select outer function" }
            )
            map(
                { "x", "o" },
                "if",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
                end,
                { desc = "Select inner function" }
            )
            map(
                { "x", "o" },
                "ac",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
                end,
                { desc = "Select outer class" }
            )
            map(
                { "x", "o" },
                "ic",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
                end,
                { desc = "Select inner class" }
            )
            map(
                { "x", "o" },
                "aa",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
                end,
                { desc = "Select outer parameter" }
            )
            map(
                { "x", "o" },
                "ia",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
                end,
                { desc = "Select inner parameter" }
            )

            -- Move keymaps
            local move = require "nvim-treesitter-textobjects.move"
            map(
                { "n", "x", "o" },
                "]m",
                function() move.goto_next_start("@function.outer", "textobjects") end,
                { desc = "Next function start" }
            )
            map(
                { "n", "x", "o" },
                "]M",
                function() move.goto_next_end("@function.outer", "textobjects") end,
                { desc = "Next function end" }
            )
            map(
                { "n", "x", "o" },
                "]]",
                function() move.goto_next_start("@class.outer", "textobjects") end,
                { desc = "Next class start" }
            )
            map(
                { "n", "x", "o" },
                "][",
                function() move.goto_next_end("@class.outer", "textobjects") end,
                { desc = "Next class end" }
            )
            map(
                { "n", "x", "o" },
                "[m",
                function() move.goto_previous_start("@function.outer", "textobjects") end,
                { desc = "Previous function start" }
            )
            map(
                { "n", "x", "o" },
                "[M",
                function() move.goto_previous_end("@function.outer", "textobjects") end,
                { desc = "Previous function end" }
            )
            map(
                { "n", "x", "o" },
                "[[",
                function() move.goto_previous_start("@class.outer", "textobjects") end,
                { desc = "Previous class start" }
            )
            map(
                { "n", "x", "o" },
                "[]",
                function() move.goto_previous_end("@class.outer", "textobjects") end,
                { desc = "Previous class end" }
            )
        end,
    },
}
