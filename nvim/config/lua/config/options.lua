-- ============================================================================
-- Leader Keys
-- ============================================================================
vim.g.mapleader = " " -- Set global leader key to Space
vim.g.maplocalleader = " " -- Set local leader key to Space (for filetype-specific keymaps)

-- ============================================================================
-- Editor Behavior
-- ============================================================================
-- Scrolling
vim.opt.scrolloff = 6 -- Keep 6 lines of context above/below the cursor (improves visibility while scrolling)

-- ============================================================================
-- Editing & Indentation
-- ============================================================================
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Number of spaces used for autoindent
vim.opt.tabstop = 4 -- Display width of a Tab character as 4 spaces
vim.opt.smartindent = true -- Smart auto indentation (C-style)

-- ============================================================================
-- Timing & Performance
-- ============================================================================
-- Timeout Length
vim.opt.timeoutlen = 350 -- Timeout for mapped key sequences (ms)

-- Update Time
vim.opt.updatetime = 200 -- CursorHold trigger time (ms); affects diagnostic message display speed

-- ============================================================================
-- Integration
-- ============================================================================
-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Integrate with the system clipboard (share copy/paste)

-- File Format
vim.opt.fixeol = true -- Append EOL (end of line) automatically when saving

-- File Handling
vim.o.autoread = true -- Automatically reload file when changed externally

-- ========================================================================
-- UI & Appearance
-- ========================================================================
-- Colors
vim.opt.termguicolors = true -- Enable 24-bit RGB color support (richer colors)

-- Colorscheme
vim.g.colorscheme = "dracula" -- Available: "dracula", "catppuccin-nvim"

-- Line Numbers
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = false -- Disable relative line numbers

-- Sign Column
vim.opt.signcolumn = "yes" -- Always show the sign column (area for Git/LSP diagnostics, etc.)

-- Line Wrapping
vim.opt.wrap = false -- Disable automatic line wrapping for long lines

-- ========================================================================
-- Navigation & Window Management
-- ========================================================================
-- Mouse
vim.opt.mouse = "a" -- Enable mouse support in all modes

-- Split Behavior
vim.opt.splitbelow = true -- Open new window below on horizontal split
vim.opt.splitright = true -- Open new window to the right on vertical split
