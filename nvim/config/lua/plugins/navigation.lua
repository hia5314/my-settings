return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = { "Neotree" },
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        opts = {
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    never_show = { ".git" },
                },
            },
        },
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "echasnovski/mini.icons" },
        lazy = false,
        config = function()
            require("oil").setup {
                default_file_explorer = true,
                columns = {
                    "icon",
                    "permissions",
                    "size",
                    "mtime",
                },
                delete_to_trash = true,
                skip_confirm_for_simple_edits = true,
                view_options = {
                    show_hidden = true,
                    is_always_hidden = function(name, bufnr) return name == ".." or name == ".git" end,
                },
                float = {
                    padding = 2,
                    max_width = 100,
                    max_height = 30,
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                },
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-v>"] = "actions.select_vsplit",
                    ["<C-x>"] = "actions.select_split",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["<C-r>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                },
            }
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        version = false,
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            local actions = require "telescope.actions"
            return { defaults = { mappings = { i = { ["<esc>"] = actions.close } } } }
        end,
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup {
                timeout = 3000,
                max_height = function() return math.floor(vim.o.lines * 0.75) end,
                max_width = function() return math.floor(vim.o.columns * 0.75) end,
            }

            vim.notify = require "notify"
        end,
    },

    { "folke/trouble.nvim", cmd = "Trouble", opts = { auto_open = false } },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local wk = require "which-key"
            wk.setup {
                preset = "modern",
                plugins = {
                    marks = true,
                    registers = true,
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    },
                    presets = {
                        operators = true,
                        motions = true,
                        text_objects = true,
                        windows = true,
                        nav = true,
                        z = true,
                        g = true,
                    },
                },
                win = {
                    border = "rounded",
                    padding = { 2, 2, 2, 2 },
                },
                layout = {
                    height = { min = 4, max = 25 },
                    width = { min = 20, max = 50 },
                    spacing = 3,
                    align = "left",
                },
                icons = {
                    breadcrumb = "»",
                    separator = "➜",
                    group = "+",
                },
            }
        end,
    },
}
