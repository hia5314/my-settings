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
vim.opt.timeoutlen = 350 -- Timeout for mapped key sequences (ms)

-- ============================================================================
-- Integration
-- ============================================================================
-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Integrate with the system clipboard (share copy/paste)

-- File Format
vim.opt.fixeol = true -- Append EOL (end of line) automatically when saving
