return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("Comment").setup {
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = {
                    line = "gcc",
                    block = "gbc",
                },
                opleader = {
                    line = "gcc",
                    block = "gbc",
                },
                extra = {
                    above = "gcO",
                    below = "gco",
                    eol = "gcA",
                },
                mappings = {
                    basic = true,
                    extra = true,
                },
            }
        end,
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        init = function() vim.g.nvim_surround_no_mappings = true end,
        opts = {},
    },
}
