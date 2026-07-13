-- VS Code(vscode-neovim 확장) 임베드 환경 전용 키맵.
-- 순수 nvim(lua/config/keymaps.lua)과 같은 키 감각을 VS Code 명령으로 매핑한다.
-- 편집(hjkl, 텍스트오브젝트, surround 등)은 nvim이 처리하고, leader 키들은 VS Code UI를 호출한다.
local map = vim.keymap.set

-- Surround (nvim-surround v4: keymaps via <Plug> mappings) — upstream 유지
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

-- 이하 로컬 추가: VS Code UI 호출 매핑 (2026-07-13)
local vscode = require "vscode"

local function action(command)
    return function() vscode.action(command) end
end

-- Navigation (<leader>f — Telescope 대응)
map("n", "<leader>e", action "workbench.view.explorer", { desc = "File Explorer" })
map("n", "<leader>ff", action "workbench.action.quickOpen", { desc = "Find files" })
map("n", "<leader>fg", action "workbench.action.findInFiles", { desc = "Live grep" })
map("n", "<leader>fb", action "workbench.action.showAllEditors", { desc = "Buffers" })
map("n", "<leader>fr", action "editor.action.goToReferences", { desc = "References" })

-- UI (버퍼 ↔ 에디터 탭)
map("n", "<S-l>", action "workbench.action.nextEditor", { desc = "Next editor" })
map("n", "<S-h>", action "workbench.action.previousEditor", { desc = "Prev editor" })
map("n", "<leader>bd", action "workbench.action.closeActiveEditor", { desc = "Close editor" })
map("n", "<leader>bl", action "workbench.action.closeEditorsToTheLeft", { desc = "Close editors to left" })
map("n", "<leader>br", action "workbench.action.closeEditorsToTheRight", { desc = "Close editors to right" })

-- Diagnostics (<leader>x/d — Trouble·diagnostic 대응)
map("n", "<leader>xx", action "workbench.actions.view.problems", { desc = "Diagnostics (Problems)" })
map("n", "<leader>dn", action "editor.action.marker.next", { desc = "Next diagnostic" })
map("n", "<leader>dp", action "editor.action.marker.prev", { desc = "Prev diagnostic" })

-- Terminal
map("n", "<leader>tf", action "workbench.action.terminal.toggleTerminal", { desc = "Toggle terminal" })

-- Git
map("n", "<leader>gs", action "workbench.view.scm", { desc = "Source Control" })
map("n", "<leader>gd", action "git.openChange", { desc = "Git diff" })

-- LSP (VS Code 언어 기능 호출)
map("n", "K", action "editor.action.showHover", { desc = "Hover" })
map("n", "gd", action "editor.action.revealDefinition", { desc = "Goto Definition" })
map("n", "gD", action "editor.action.revealDeclaration", { desc = "Goto Declaration" })
map("n", "gI", action "editor.action.goToImplementation", { desc = "Goto Implementation" })
map("n", "<leader>rn", action "editor.action.rename", { desc = "Rename symbol" })
map({ "n", "v" }, "<leader>ca", action "editor.action.quickFix", { desc = "Code action" })

-- Formatting
map("n", "<leader>F", action "editor.action.formatDocument", { desc = "Format document" })
map("v", "<leader>F", action "editor.action.formatSelection", { desc = "Format selection" })
