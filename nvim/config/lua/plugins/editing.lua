return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                opts = { enable_autocmd = false },
            },
        },
        config = function()
            require("Comment").setup {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
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
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
                ts_config = {
                    lua = { "string" },
                    javascript = { "template_string" },
                    java = false,
                },
                disable_filetype = { "TelescopePrompt", "vim" },
                fast_wrap = {
                    map = "<M-e>",
                    chars = { "{", "[", "(", '"', "'" },
                    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                    end_key = "$",
                    keys = "qwertyuiopzxcvbnmasdfghjkl",
                    check_comma = true,
                    highlight = "Search",
                    highlight_grey = "Comment",
                },
            }

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            local cmp = require "cmp"
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        init = function() vim.g.nvim_surround_no_mappings = true end,
        opts = {},
    },

    { "L3MON4D3/LuaSnip", event = "InsertEnter", build = "make install_jsregexp", opts = {} },

    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
        dependencies = { "L3MON4D3/LuaSnip" },
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- 로컬 추가 (upstream에 없음): 프로젝트 전역 검색·치환
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Search and Replace" },
        },
    },
}
