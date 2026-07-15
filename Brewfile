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
brew "bat"                   # 문법 하이라이트되는 cat — alias cat 연동(zsh/.zshrc)
brew "eza"                   # ls 대체 (git 상태·트리) — alias ls/ll/la/lt(zsh/.zshrc)
brew "sd"                    # sed 대체 — 직관적 찾기/바꾸기
brew "fzf"                   # 퍼지 파인더 — Ctrl-R/Ctrl-T/Alt-C (zsh/.zshrc 연동)
brew "fzf-tab"               # 탭 완성 후보를 fzf UI로 — zsh/.zshrc [4]에서 로드
brew "htop"
brew "procs"                 # ps 대체 (색상·트리)
brew "dust"                  # du 대체 — 디렉터리 용량 한눈에
brew "duf"                   # df 대체 — 디스크 마운트 표
brew "btop"                  # 시스템 모니터 (htop/top 상위호환) — alias top 연동(zsh/.zshrc)
brew "watch"
brew "wget"
brew "xh"                    # curl/httpie 대체 — 친절한 HTTP 클라이언트
brew "tealdeer"              # tldr — 명령어 실전 예제 요약 man
brew "lazygit"
brew "git-delta"             # git diff/blame 페이저 — 설정: git/.gitconfig

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
brew "lazydocker"            # docker/colima TUI (lazygit의 도커판)
brew "dive"                  # 도커 이미지 레이어 분석 (용량 최적화)
brew "helm"
brew "k9s"
brew "kubernetes-cli"
brew "kubectx"               # 컨텍스트/네임스페이스 전환 (kubens 포함) — 완성은 fpath로 자동
brew "kubecolor"             # kubectl 출력 색칠 — alias k 계열 연동(zsh/.zshrc)
brew "hadolint"              # Dockerfile 린터

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
brew "zsh-autosuggestions"   # 히스토리 기반 자동제안
brew "zsh-completions"
brew "zsh-syntax-highlighting"  # 명령어 문법 하이라이트

# -----------------------------------------------------------------------------
# Fonts — 주 폰트 PragmataPro Mono NF는 상용이라 수동 설치 (private/fonts/)
# -----------------------------------------------------------------------------
cask "font-d2coding"         # VS Code 폴백 폰트
