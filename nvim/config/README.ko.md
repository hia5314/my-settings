# Neovim 설정

[English](./README.md)

풀스택 개발자를 위한 프로덕션 수준의 Neovim 설정입니다. LSP 지원, 자동 완성, 디버깅, Git 통합, AI 지원을 포함한 완벽한 IDE 환경을 제공합니다.

## 주요 기능

- **플러그인 매니저**: [lazy.nvim](https://github.com/folke/lazy.nvim) - 지연 로딩으로 빠른 시작
- **테마**: [Dracula](https://github.com/dracula/vim) (기본), [Catppuccin](https://github.com/catppuccin/nvim) (Frappe 변형)
- **LSP 지원**: Mason을 통한 15개 언어 서버 자동 설치
- **자동 완성**: nvim-cmp (LSP, 버퍼, 경로, 스니펫 소스)
- **포매팅**: conform.nvim - 저장 시 자동 포맷
- **린팅**: nvim-lint - 저장 시 자동 린트
- **디버깅**: DAP 지원 (Python, Go, JavaScript)
- **Git 통합**: gitsigns, vim-fugitive, lazygit
- **AI 통합**: claudecode.nvim을 통한 Claude Code 지원
- **듀얼 환경**: 순수 Neovim 및 VSCode Neovim 익스텐션 지원

## 요구 사항

### 필수

| 의존성                                           | 설명                               |
| ------------------------------------------------ | ---------------------------------- |
| [Neovim](https://neovim.io/) >= 0.12             | 텍스트 에디터                      |
| [Git](https://git-scm.com/)                      | 버전 관리                          |
| [Node.js](https://nodejs.org/) >= 18             | 다수의 LSP 서버에 필요             |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | 빠른 검색 (Telescope live grep 용) |
| [fd](https://github.com/sharkdp/fd)              | 빠른 파일 검색 (Telescope 용)      |
| [Nerd Font](https://www.nerdfonts.com/)          | 아이콘 지원                        |

### 언어별 요구 사항

| 언어   | 요구 사항                                                |
| ------ | -------------------------------------------------------- |
| Go     | `go` (gopls, gofumpt, goimports는 Mason으로 설치)        |
| Python | `python3` (basedpyright, ruff, debugpy는 Mason으로 설치) |
| Lua    | 없음 (lua_ls는 Mason으로 설치)                           |

### 기타 도구

| 도구                                                | 용도          | 설치 방법                                  |
| --------------------------------------------------- | ------------- | ------------------------------------------ |
| [Claude Code](https://claude.ai/download)           | AI 어시스턴트 | `npm install -g @anthropic-ai/claude-code` |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI       | `brew install lazygit`                     |
| [htop](https://htop.dev/)                           | 프로세스 뷰어 | `brew install htop`                        |

### 외부 도구

포매터와 린터는 수동 설치가 필요합니다. 전체 목록과 설치 방법은 [docs/external-tools.md](./docs/external-tools.md)를 참조하세요.

## 설치

1. **기존 설정 백업** (있는 경우):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **저장소 클론**:

   ```bash
   git clone https://github.com/hwyncho/neovim-settings.git ~/.config/nvim
   ```

3. **Neovim 시작**:

   ```bash
   nvim
   ```

   첫 실행 시 Lazy.nvim이 자동으로 설치되고 모든 플러그인이 설치됩니다.

4. **LSP 서버 설치**:

   LSP 서버는 Mason을 통해 자동 설치됩니다. 수동으로 설치하려면:

   ```vim
   :Mason
   ```

## 키 바인딩

리더 키는 `<Space>`입니다. `<leader>`를 누르고 기다리면 which-key를 통해 사용 가능한 키 그룹을 볼 수 있습니다.

전체 키 바인딩 목록과 모드 정보는 [docs/key-bindings.md](./docs/key-bindings.md)를 참조하세요.

### 빠른 참조

| 키           | 모드 | 설명                        |
| ------------ | ---- | --------------------------- |
| `<leader>e`  | n    | 파일 탐색기 토글 (Neo-tree) |
| `<leader>ff` | n    | 파일 검색                   |
| `<leader>fg` | n    | Live grep                   |
| `K`          | n    | 호버 정보                   |
| `gd`         | n    | 정의로 이동                 |
| `<leader>ca` | n, v | 코드 액션                   |
| `<leader>gl` | n    | LazyGit                     |
| `<leader>ac` | n    | Claude 토글                 |
| `<F5>`       | n    | 디버그: 계속                |
| `<F9>`       | n    | 디버그: 중단점 토글         |

## 지원 언어

Lua, Python, Go, TypeScript/JavaScript, HTML, CSS, JSON, YAML, Markdown, Shell, Dockerfile, Docker Compose

각 언어별 LSP, 포매터, 린터, 디버거에 대한 자세한 정보는 [docs/supported-languages.md](./docs/supported-languages.md)를 참조하세요.

## 라이선스

MIT License
