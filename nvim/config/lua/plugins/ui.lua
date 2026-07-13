return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup {
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                background = {
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = false,
                show_end_of_buffer = false,
                term_colors = true,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false,
                no_bold = false,
                no_underline = false,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    telescope = true,
                    notify = true,
                    mason = true,
                    which_key = true,
                    dap = true,
                    dap_ui = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                },
            }
        end,
    },

    {
        "dracula/vim",
        name = "dracula",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.dracula_colorterm = 1
            vim.g.dracula_italic = 1
            vim.g.dracula_full_special_attrs_support = 1
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("lualine").setup {
                options = {
                    theme = vim.g.colorscheme,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = { "alpha", "dashboard" },
                        winbar = {},
                    },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "branch",
                        "diff",
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            sections = { "error", "warn", "info", "hint" },
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                                hint = " ",
                            },
                        },
                    },
                    lualine_c = {
                        {
                            "filename",
                            file_status = true,
                            path = 1,
                        },
                    },
                    lualine_x = {
                        "encoding",
                        {
                            "fileformat",
                            symbols = {
                                unix = "",
                                dos = "",
                                mac = "",
                            },
                        },
                        "filetype",
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { "nvim-tree", "toggleterm", "mason" },
            }
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            { "echasnovski/mini.bufremove", version = false },
        },
        event = "VeryLazy",
        config = function()
            local bufremove = function(n, force) require("mini.bufremove").delete(n, force or false) end
            require("bufferline").setup {
                options = {
                    mode = "buffers",
                    themable = true,
                    numbers = "none",
                    close_command = function(n) bufremove(n, false) end,
                    right_mouse_command = function(n) bufremove(n, false) end,
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = function(n) bufremove(n, true) end,
                    indicator = {
                        icon = "▎",
                        style = "icon",
                    },
                    buffer_close_icon = "",
                    modified_icon = "●",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    max_name_length = 18,
                    max_prefix_length = 15,
                    truncate_names = true,
                    tab_size = 20,
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    diagnostics_indicator = function(_, _, diag)
                        local t = {}
                        if diag.error then
                            table.insert(t, " " .. diag.error)
                        end
                        if diag.warning then
                            table.insert(t, " " .. diag.warning)
                        end
                        if diag.info then
                            table.insert(t, " " .. diag.info)
                        end
                        if diag.hint then
                            table.insert(t, " " .. diag.hint)
                        end
                        return table.concat(t, " ")
                    end,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Explorer",
                            text_align = "center",
                            highlight = "Directory",
                            separator = true,
                        },
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    show_duplicate_prefix = true,
                    persist_buffer_sort = true,
                    separator_style = "thin",
                    enforce_regular_tabs = false,
                    always_show_bufferline = true,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { "close" },
                    },
                    sort_by = "insert_after_current",
                },
            }
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
        },
    },
}
