return {
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local function setup_jdtls()
                local jdtls = require "jdtls"

                local mason_registry = require "mason-registry"
                local jdtls_pkg = mason_registry.get_package "jdtls"
                local jdtls_path = jdtls_pkg:get_install_path()

                local os_config
                if vim.fn.has "mac" == 1 then
                    os_config = "config_mac"
                elseif vim.fn.has "unix" == 1 then
                    os_config = "config_linux"
                else
                    os_config = "config_win"
                end

                local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
                local workspace_dir = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. project_name

                local capabilities = vim.lsp.protocol.make_client_capabilities()
                local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
                if ok_cmp then
                    capabilities = cmp_lsp.default_capabilities(capabilities)
                end

                local bundles = {}

                -- java-debug-adapter
                local ok_debug, debug_pkg = pcall(mason_registry.get_package, "java-debug-adapter")
                if ok_debug then
                    local debug_path = debug_pkg:get_install_path()
                    local debug_jar =
                        vim.fn.glob(debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
                    if debug_jar ~= "" then
                        table.insert(bundles, debug_jar)
                    end
                end

                -- java-test
                local ok_test, test_pkg = pcall(mason_registry.get_package, "java-test")
                if ok_test then
                    local test_path = test_pkg:get_install_path()
                    local test_jars = vim.fn.glob(test_path .. "/extension/server/*.jar", true, true)
                    for _, jar in ipairs(test_jars) do
                        table.insert(bundles, jar)
                    end
                end

                local config = {
                    cmd = {
                        "java",
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundles.defaultStartLevel=4",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product",
                        "-Dlog.protocol=true",
                        "-Dlog.level=ALL",
                        "-Xmx1g",
                        "--add-modules=ALL-SYSTEM",
                        "--add-opens",
                        "java.base/java.util=ALL-UNNAMED",
                        "--add-opens",
                        "java.base/java.lang=ALL-UNNAMED",
                        "-jar",
                        vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                        "-configuration",
                        jdtls_path .. "/" .. os_config,
                        "-data",
                        workspace_dir,
                    },
                    root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
                    capabilities = capabilities,
                    settings = {
                        java = {
                            signatureHelp = { enabled = true },
                            contentProvider = { preferred = "fernflower" },
                            completion = {
                                favoriteStaticMembers = {
                                    "org.junit.Assert.*",
                                    "org.junit.jupiter.api.Assertions.*",
                                    "java.util.Objects.requireNonNull",
                                    "java.util.Objects.requireNonNullElse",
                                },
                            },
                            sources = {
                                organizeImports = {
                                    starThreshold = 9999,
                                    staticStarThreshold = 9999,
                                },
                            },
                        },
                    },
                    init_options = {
                        bundles = bundles,
                    },
                }

                jdtls.start_or_attach(config)
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = setup_jdtls,
            })

            -- Run immediately if already in a Java buffer
            if vim.bo.filetype == "java" then
                setup_jdtls()
            end
        end,
    },
}
