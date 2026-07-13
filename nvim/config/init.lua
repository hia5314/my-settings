local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
    require "vscode-neovim.config.options"
    require "vscode-neovim.config.keymaps"
    require "vscode-neovim.config.autocmds"

    require("lazy").setup({ import = "vscode-neovim.plugins" }, {
        ui = { border = "rounded" },
        change_detection = { notify = false },
        performance = {
            rtp = {
                disabled_plugins = {
                    "gzip",
                    "matchit",
                    "matchparen",
                    "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "zipPlugin",
                },
            },
        },
    })
else
    require "config.options"
    require "config.keymaps"
    require "config.autocmds"

    require("lazy").setup({ import = "plugins" }, {
        ui = { border = "rounded" },
        change_detection = { notify = false },
        performance = {
            rtp = {
                disabled_plugins = {
                    "gzip",
                    "matchit",
                    "matchparen",
                    "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "zipPlugin",
                },
            },
        },
    })

    vim.cmd.colorscheme(vim.g.colorscheme)
end
