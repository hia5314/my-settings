# =============================================================================
# Homebrew Bundle File
# Install: brew bundle --file=Brewfile
# 2026-07 전면 재정비 — 실사용 검증을 거친 최소 구성 (현재 설치 상태와 1:1)
# =============================================================================

# -----------------------------------------------------------------------------
# CLI Tools
# -----------------------------------------------------------------------------
brew "fd"                    # find 대체
brew "gh"                    # GitHub CLI — github.com + github.nhnent.com 모두 gh auth login
brew "jq"                    # JSON processor
brew "yq"                    # YAML processor
brew "ripgrep"               # 빠른 grep
brew "htop"
brew "watch"
brew "wget"
brew "lazygit"

# -----------------------------------------------------------------------------
# Build / Lint
# -----------------------------------------------------------------------------
brew "shellcheck"            # Shell 린터
brew "shfmt"                 # Shell 포매터
brew "dotenv-linter"
brew "golangci-lint"         # Go 통합 린터 — 터미널/CI용 (nvim은 Mason 사본 사용)
brew "tree-sitter-cli"       # nvim-treesitter용

# -----------------------------------------------------------------------------
# Languages & Runtimes — brew 직접 설치, 전역 단일 버전 (Python만 uv 전담)
# -----------------------------------------------------------------------------
brew "openjdk@21"            # keg-only — JAVA_HOME/PATH는 zsh/.zshrc (무버전 openjdk는 maven 의존성)
brew "maven"
brew "go"                    # GOPATH=~/Library/Go (에디터용 go 도구는 nvim Mason이 자동 설치)
brew "node@22"               # LTS, keg-only — PATH는 zsh/.zshrc, 전역 패키지: node/default-npm-packages
brew "uv"                    # Python 전담 — 런타임(uv python install)과 패키지(.venv, uv tool) 모두

# -----------------------------------------------------------------------------
# Containers & Kubernetes
# -----------------------------------------------------------------------------
brew "colima", restart_service: :changed   # vz + Rosetta + virtiofs 구성 (qemu 불필요)
brew "docker"
brew "docker-buildx"
brew "docker-compose"
brew "helm"
brew "k9s"
brew "kubernetes-cli"
brew "hadolint"              # Dockerfile 린터

# -----------------------------------------------------------------------------
# Databases — 서버는 docker(colima)로 기동, 클라이언트만 로컬
# -----------------------------------------------------------------------------
brew "libpq"                 # psql 클라이언트

# -----------------------------------------------------------------------------
# Editors
# -----------------------------------------------------------------------------
brew "neovim"                # 설정 관리: nvim/README.md
brew "vim"                   # 터미널 빠른 편집용 (alias vi=vim)

# -----------------------------------------------------------------------------
# Terminal & Shell
# -----------------------------------------------------------------------------
brew "powerlevel10k"         # zsh 프롬프트 — 개인 설정: zsh/.p10k.zsh
brew "tmux"
brew "zsh-completions"

# -----------------------------------------------------------------------------
# Fonts — 주 폰트 PragmataPro Mono NF는 상용이라 수동 설치 (private/fonts/)
# -----------------------------------------------------------------------------
cask "font-d2coding"         # VS Code 폴백 폰트

# -----------------------------------------------------------------------------
# Casks (GUI)
# Claude Code는 brew가 아니라 네이티브 설치(자동 업데이트):
#   curl -fsSL https://claude.ai/install.sh | bash
# -----------------------------------------------------------------------------
cask "iterm2"                # 프로파일: private/iterm/Default.json (수동 import)
cask "visual-studio-code"    # 설정: vscode/
cask "intellij-idea"         # IDE 3종 병행 — 신규 팀 주력 스택 확정 후 정리 검토
cask "pycharm"
