return {
    { "towolf/vim-helm", ft = { "helm" } },

    {
        "ellisonleao/dotenv.nvim",
        config = function()
            require("dotenv").setup {
                enable_on_load = true,
                verbose = false,
            }
        end,
    },

    { "mason-org/mason.nvim", build = ":MasonUpdate", opts = {} },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "basedpyright",
                    "ruff",
                    "gopls",
                    "yamlls",
                    "helm_ls",
                    "html",
                    "cssls",
                    "emmet_ls",
                    "ts_ls",
                    "jsonls",
                    "dockerls",
                    "docker_compose_language_service",
                    "bashls",
                    "marksman",
                    "kotlin_language_server",
                },
                automatic_installation = true,
                automatic_enable = true,
            }
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup {
                ensure_installed = {
                    -- Formatters
                    "stylua",
                    "black",
                    "isort",
                    "gofumpt",
                    "goimports",
                    "prettier",
                    "prettierd",
                    "biome",
                    "shfmt",
                    -- Java
                    "jdtls",
                    "java-debug-adapter",
                    "java-test",
                    "google-java-format",
                    -- Kotlin
                    "ktlint",
                    "kotlin-debug-adapter",
                    -- Linters
                    "golangci-lint",
                    "yamllint",
                    "shellcheck",
                    "hadolint",
                    "markdownlint-cli2",
                    "eslint_d",
                    "stylelint",
                },
            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        priority = 50,
        dependencies = { "b0o/schemastore.nvim" },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if ok_cmp then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end

            local function on_attach(client, bufnr) end

            local servers = {
                lua_ls = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },

                basedpyright = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoSearchPaths = true,
                                diagnosticMode = "workspace",
                                useLibraryCodeForTypes = true,
                            },
                        },
                    },
                },

                ruff = {
                    capabilities = capabilities,
                    on_attach = function(client, bufnr) client.server_capabilities.hoverProvider = false end,
                },

                gopls = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        gopls = {
                            gofumpt = true,
                            analyses = { unusedparams = true, unreachable = true },
                            staticcheck = true,
                        },
                    },
                },

                yamlls = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        yaml = {
                            validate = true,
                            format = { enable = false },
                            completion = true,
                            schemaStore = { enable = false, url = "" },
                            schemas = require("schemastore").yaml.schemas(),
                        },
                    },
                },

                helm_ls = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        ["helm-ls"] = {
                            yamlls = {
                                enabled = true,
                                path = "yaml-language-server",
                            },
                        },
                    },
                },

                html = { capabilities = capabilities, on_attach = on_attach },

                cssls = { capabilities = capabilities, on_attach = on_attach },

                emmet_ls = { capabilities = capabilities, on_attach = on_attach },

                ts_ls = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        javascript = { inlayHints = { includeInlayFunctionLikeReturnTypeHints = true } },
                        typescript = { inlayHints = { includeInlayFunctionLikeReturnTypeHints = true } },
                    },
                },

                jsonls = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } },
                    },
                },

                dockerls = { capabilities = capabilities, on_attach = on_attach },

                docker_compose_language_service = { capabilities = capabilities, on_attach = on_attach },

                bashls = { capabilities = capabilities, on_attach = on_attach },

                marksman = { capabilities = capabilities, on_attach = on_attach },

                kotlin_language_server = { capabilities = capabilities, on_attach = on_attach },
            }

            for name, conf in pairs(servers) do
                vim.lsp.config(name, conf)
                vim.lsp.enable(name)
            end
        end,
    },
}
