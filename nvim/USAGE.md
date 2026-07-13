# Neovim 사용 가이드

> 설정 위치: 이 저장소의 `nvim/config/` (bootstrap이 `~/.config/nvim`으로 복사) — 관리 방법은 [README.md](./README.md) 참조.
> 전체 키맵·외부 도구·지원 언어 상세는 `config/docs/` 참조. 이 문서는 일상 사용에 필요한 핵심만 정리한 것이다.

## 기본 동작

- **리더 키는 `<Space>`** — 누르고 잠시 기다리면 which-key가 사용 가능한 키 그룹을 보여준다. 키가 기억나지 않으면 일단 Space를 누르고 기다릴 것.
- 시스템 클립보드와 공유(`clipboard=unnamedplus`) — `y`/`p`가 macOS 클립보드와 바로 연동된다.
- 마우스 사용 가능(`mouse=a`), 인덴트는 스페이스 4칸, 줄 바꿈(wrap) 없음.
- **저장 시 자동 포맷(conform) + 자동 린트(nvim-lint)** 가 동작한다. 끄고 싶으면 `<leader>uf`.
- 외부에서 파일이 바뀌면 자동으로 다시 읽는다(`autoread`).

## 파일 탐색 · 검색

| 키 | 설명 |
|---|---|
| `<leader>e` | 파일 트리 토글 (Neo-tree) |
| `-` | Oil 파일 브라우저 — 디렉터리를 버퍼처럼 편집(이름 변경/삭제를 텍스트 편집으로) |
| `<leader>ff` | 파일 이름으로 찾기 (Telescope, fd 기반) |
| `<leader>fg` | 내용으로 찾기 — live grep (ripgrep 기반) |
| `<leader>fb` | 열린 버퍼 목록 |
| `<leader>fh` | Neovim 도움말 검색 |
| `<leader>sr` | 프로젝트 전역 찾기/바꾸기 (Spectre — 로컬 추가 플러그인) |

## 편집

**자동완성 (nvim-cmp, 입력 모드):**

| 키 | 설명 |
|---|---|
| `<Tab>` / `<S-Tab>` | 다음/이전 항목 선택 |
| `<CR>` | 선택 확정 |
| `<C-Space>` | 완성 목록 강제 표시 |
| `<C-e>` | 완성 취소 |
| `<C-b>` / `<C-f>` | 문서 미리보기 스크롤 |

**코드 조작:**

| 키 | 모드 | 설명 |
|---|---|---|
| `gcc` / `gc`(선택) | n / v | 줄 주석 토글 |
| `ys{motion}{char}` | n | 감싸기 추가 (예: `ysiw"` → 단어를 `"`로) |
| `cs{old}{new}` / `ds{char}` | n | 감싸기 변경 / 제거 |
| `af` `if` / `ac` `ic` / `aa` `ia` | v, o | 함수/클래스/인자 텍스트 오브젝트 (예: `dif` = 함수 내부 삭제) |
| `]m` `[m` / `]]` `[[` | n | 다음·이전 함수 / 클래스로 이동 |
| `<C-Space>` → `<C-Space>`/`<BS>` | n → v | 구문 단위 선택 확장/축소 (Treesitter) |

## LSP · 진단

| 키 | 설명 |
|---|---|
| `gd` / `gD` / `gI` | 정의 / 선언 / 구현으로 이동 |
| `K` | 호버 문서 |
| `<leader>fr` | 참조 검색 (Telescope) |
| `<leader>rn` | 심볼 이름 변경 |
| `<leader>ca` | 코드 액션 (n, v) |
| `<leader>dl` / `<leader>dn` / `<leader>dp` | 현재 줄 진단 / 다음 / 이전 진단 |
| `<leader>xx` | 프로젝트 전체 진단 목록 (Trouble) |
| `<leader>xs` | 심볼 아웃라인 (Trouble) |

LSP 서버(gopls, basedpyright, ruff, jdtls, typescript-language-server 등)는 mason-tool-installer가 자동 설치·관리한다.

## 포맷 · 린트

| 키 | 설명 |
|---|---|
| `<leader>F` | 수동 포맷 (n, v) |
| `<leader>uf` | 저장 시 자동 포맷 켜기/끄기 |

- 저장할 때마다 언어별 포매터가 실행된다 (Python: ruff, Go: gofumpt+goimports, Shell: shfmt, JS/TS 등: prettierd). 200KB 초과 파일은 자동 포맷 제외.
- 포매터·린터도 mason-tool-installer가 자동 설치한다. 프로젝트에 자체 설정(.prettierrc, devDependencies 등)이 있으면 그쪽이 우선된다.

## Git

| 키 | 설명 |
|---|---|
| `<leader>gl` | **LazyGit** (주력 — 스테이징/커밋/브랜치 전부 TUI로) |
| `<leader>gs` / `gc` / `gp` / `gP` | status / commit / push / pull (fugitive) |
| `<leader>gb` | blame |
| `<leader>gd` | diff 분할 화면 |

변경 라인 표시(gitsigns)는 sign column에 자동 표시된다.

## 터미널

| 키 | 설명 |
|---|---|
| `<C-\>` | 터미널 토글 |
| `<leader>tf` / `th` / `tv` | 플로팅 / 가로 / 세로 터미널 |
| `<leader>tp` / `tn` | Python / Node REPL |
| `<Esc>` 또는 `jk` | 터미널 모드 빠져나오기 |
| `<C-h/j/k/l>` | (터미널에서) 창 이동 |

## 디버깅 (DAP — Python, Go, JS)

| 키 | 설명 |
|---|---|
| `<F9>` | 중단점 토글 |
| `<F5>` | 시작/계속 |
| `<F10>` / `<F11>` / `<F12>` | step over / into / out |
| `<leader>D` | 디버그 UI 토글 |

## Claude Code 연동 (claudecode.nvim)

| 키 | 설명 |
|---|---|
| `<leader>ac` | Claude 패널 토글 |
| `<leader>ar` / `<leader>aC` | 세션 resume / continue |
| `<leader>ab` | 현재 버퍼를 컨텍스트로 추가 |
| `<leader>as` | (비주얼) 선택 영역을 Claude에 전송 |
| `<leader>aa` / `<leader>ad` | Claude가 제안한 diff 수락 / 거부 |
| `<leader>am` | 모델 선택 |

## 버퍼 · 창

| 키 | 설명 |
|---|---|
| `<S-l>` / `<S-h>` | 다음 / 이전 버퍼 (탭줄) |
| `<leader>bd` | 버퍼 닫기 (창 유지) |
| `<leader>bs` / `bx` | 버퍼 선택 이동 / 선택 닫기 |
| `<leader>bl` / `br` | 왼쪽 / 오른쪽 버퍼 모두 닫기 |
| `<leader>qq` | 전체 종료 (`qa!`) |

## 관리 명령

| 명령 | 설명 |
|---|---|
| `:Lazy` | 플러그인 관리 UI — `S`(sync)로 업데이트. 버전은 `lazy-lock.json`에 고정됨 |
| `:Mason` | LSP 서버·포매터·린터 설치 UI (`i` 설치, `X` 제거) |
| `:LspInfo` | 현재 버퍼에 붙은 LSP 서버 확인 |
| `:checkhealth` | 설정·의존성 전반 자체 진단 |
| `:ConformInfo` | 현재 버퍼의 포매터 상태 확인 |

## 유의 사항

1. 설정은 이 저장소에서 직접 관리한다(vendored). upstream(`hwyncho/neovim-settings`) 변경을 가져올 때는 로컬 변경분([README.md](./README.md) 참조)을 유지한 채 병합할 것.
2. 플러그인 업데이트(`:Lazy sync`) 후 문제가 생기면 `lazy-lock.json`을 git으로 되돌리고 `:Lazy restore`.
3. 아이콘이 깨지면 터미널 폰트가 Nerd Font인지 확인 (현재 iTerm2: PragmataPro Mono Nerd Font).
4. VSCode에서 vscode-neovim 확장을 쓰는 경우 `lua/vscode-neovim/` 설정이 별도로 로드된다 (플러그인 최소 구성).
