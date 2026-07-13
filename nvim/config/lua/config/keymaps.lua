local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit all" })

-- Core
map("n", "<leader>n", "<Nop>", { desc = "Notifications" })
map(
    "n",
    "<leader>nd",
    function() require("notify").dismiss { silent = true, pending = true } end,
    { desc = "Dissmiss notifications" }
)

-- UI
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>b", "<Nop>", { desc = "Buffer" })
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin/Unpin buffer" })
map("n", "<leader>bs", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
map("n", "<leader>bx", "<cmd>BufferLinePickClose<cr>", { desc = "Pick & close buffer" })
map("n", "<leader>bm", "<Nop>", { desc = "Move buffer" })
map("n", "<leader>bmn", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer →" })
map("n", "<leader>bmp", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer ←" })
map("n", "<leader>bd", function() require("mini.bufremove").delete(0, false) end, { desc = "Delete buffer" })
map("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end, { desc = "Delete buffer (force)" })
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close buffers to left" })
map("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close buffers to right" })

-- Navigation
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File Explorer (Neo-tree)" })

map("n", "<leader>f", "<Nop>", { desc = "Telescope" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })

map("n", "-", "<cmd>Oil<cr>", { desc = "File Explorer (Oil)" })
map("n", "<leader>-", "<cmd>Oil --float<cr>", { desc = "File Explorer (Oil)" })

map("n", "<leader>x", "<Nop>", { desc = "Trouble" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnostics (buffer)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" })
map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })

-- Terminal
map("n", "<leader>t", "<Nop>", { desc = "Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })
map(
    "n",
    "<leader>tp",
    function()
        require("toggleterm.terminal").Terminal
            :new({ cmd = "python3", direction = "horizontal", close_on_exit = false })
            :toggle()
    end,
    { desc = "Python REPL", noremap = true, silent = true }
)
map(
    "n",
    "<leader>tn",
    function()
        require("toggleterm.terminal").Terminal
            :new({ cmd = "node", direction = "horizontal", close_on_exit = false })
            :toggle()
    end,
    { desc = "Node REPL", noremap = true, silent = true }
)
map(
    "n",
    "<leader>tt",
    function()
        require("toggleterm.terminal").Terminal:new({ cmd = "htop", direction = "float", hidden = true }):toggle()
    end,
    { desc = "Htop", noremap = true, silent = true }
)

-- Git
map("n", "<leader>g", "<Nop>", { desc = "Git" })
map("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
map("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git push" })
map("n", "<leader>gP", "<cmd>Git pull<cr>", { desc = "Git pull" })
map("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
map("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" })
map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Formatting
map("n", "<leader>uf", function()
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    print("format-on-save: " .. (vim.g.disable_autoformat and "OFF" or "ON"))
end, { desc = "Toggle format-on-save" })

map(
    { "n", "v" },
    "<leader>F",
    function() require("conform").format { async = false, lsp_fallback = true } end,
    { desc = "Format buffer" }
)

-- Surround (nvim-surround v4: keymaps via <Plug> mappings)
map("i", "<C-g>s", "<Plug>(nvim-surround-insert)", { desc = "Surround insert" })
map("i", "<C-g>S", "<Plug>(nvim-surround-insert-line)", { desc = "Surround insert line" })
map("n", "ys", "<Plug>(nvim-surround-normal)", { desc = "Surround" })
map("n", "yss", "<Plug>(nvim-surround-normal-cur)", { desc = "Surround current line" })
map("n", "yS", "<Plug>(nvim-surround-normal-line)", { desc = "Surround on new lines" })
map("n", "ySS", "<Plug>(nvim-surround-normal-cur-line)", { desc = "Surround current line on new lines" })
map("x", "S", "<Plug>(nvim-surround-visual)", { desc = "Surround visual" })
map("x", "gS", "<Plug>(nvim-surround-visual-line)", { desc = "Surround visual line" })
map("n", "ds", "<Plug>(nvim-surround-delete)", { desc = "Delete surround" })
map("n", "cs", "<Plug>(nvim-surround-change)", { desc = "Change surround" })

-- Linting
map("n", "<leader>d", "<Nop>", { desc = "Diagnostics" })
map("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>dp", function() vim.diagnostic.jump { count = -1 } end, { desc = "Prev diagnostic" })
map("n", "<leader>dn", function() vim.diagnostic.jump { count = 1 } end, { desc = "Next diagnostic" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Debugging
map("n", "<F5>", function() require("dap").continue() end, { desc = "DAP Continue" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP Step Over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP Step Into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP Step Out" })
map("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "DAP Breakpoint" })
map("n", "<leader>D", function() require("dapui").toggle() end, { desc = "DAP UI" })

-- AI
map("n", "<leader>a", "<Nop>", { desc = "AI" })
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
