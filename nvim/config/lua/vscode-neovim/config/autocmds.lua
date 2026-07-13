local aug = vim.api.nvim_create_augroup

-- Briefly highlight after yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = aug("YankHighlight", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
