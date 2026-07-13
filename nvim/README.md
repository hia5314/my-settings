# Neovim 설정

`nvim/config/`가 실제 설정이고, `~/.config/nvim`은 여기로의 심볼릭 링크다.
일상 사용 키맵·기능 요약은 [USAGE.md](./USAGE.md) 참조.

- 출처: `hwyncho/neovim-settings`의 **최신본(324b216, 2026-05-27, nvim v0.12 마이그레이션)** 기준으로
  2026-07-13 vendoring — 이제 원본 저장소가 아니라 여기서 직접 관리한다.
- **로컬 변경분(upstream과의 diff):**
  - `lua/plugins/editing.lua` — nvim-spectre 추가 (전역 검색·치환, `<leader>sr`)
  - `lua/plugins/completion.lua` — 미구성 상태였던 cmp-cmdline 제거
  - `lua/vscode-neovim/config/keymaps.lua` — VS Code UI 호출 매핑 추가 (upstream은 surround만)
  - `.gitignore` — lazy-lock.json을 추적하도록 변경 (재현성)
- 구조: `init.lua` → `lua/config/`(옵션·키맵) → `lua/plugins/`(플러그인 스펙, Java는 `lang-java.lua`).
  키맵 전체는 `config/docs/key-bindings.md`, 외부 도구는 `config/docs/external-tools.md`.

## 새 맥 설치 순서

1. bootstrap이 `~/.config/nvim → my-settings/nvim/config` 링크 생성
2. `nvim` 첫 실행 → lazy.nvim이 플러그인 58개(lazy-lock.json 고정) 설치,
   **mason-tool-installer가 LSP·포매터·린터·DAP·Java 스택(jdtls 등)을 전부 자동 설치** (수동 단계 없음)
3. 외부 CLI(shellcheck·hadolint·jq·dotenv-linter·fd·ripgrep·tree-sitter-cli)는 Brewfile로 설치됨
4. 폰트: **PragmataPro Mono Nerd Font** (상용 — 수동 설치, `~/Library/Fonts` 백업본 사용)

## VS Code 연동 (vscode-neovim)

`asvetliakov.vscode-neovim` 확장이 이 설정을 그대로 임베드해 사용한다(`vim.g.vscode` 분기).
키맵은 nvim으로 통일 — `lua/vscode-neovim/config/keymaps.lua` 참조.

## vim과의 역할 분담

- neovim: 메인 에디터 (LSP/DAP/포맷/린트 풀스택, Java 포함)
- vim (`vim/.vimrc`): 터미널 빠른 편집용 (`alias vi=vim`)
