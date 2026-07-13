return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require "dap", require "dapui"
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end,
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("nvim-dap-virtual-text").setup {
                enabled = true,
                enabled_commands = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                show_stop_reason = true,
                commented = false,
                only_first_definition = true,
                all_references = false,
                filter_references_pattern = "<module",
                virt_text_pos = "eol",
                all_frames = false,
                virt_lines = false,
                virt_text_win_col = nil,
            }
        end,
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
        config = function()
            require("mason-nvim-dap").setup {
                ensure_installed = {
                    "python",
                    "delve",
                    "js",
                    "kotlin",
                },
                automatic_installation = true,
                handlers = {},
            }
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local mason_path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(mason_path)
        end,
    },

    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function() require("dap-go").setup() end,
    },
}
