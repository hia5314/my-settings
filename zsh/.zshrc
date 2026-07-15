# =============================================================================
# ~/.zshrc — my-settings/zsh/.zshrc 를 bootstrap이 복사해 관리 (수정 시 저장소에 반영)
#
# 구성: [1] 버전·alias (자주 수정)  [2] p10k instant prompt  [3] 환경변수·PATH
#       [4] 자동완성·프롬프트       [5] 기기 한정 설정(~/.zshrc.local)
#
# ⚠️ 시크릿(토큰 등)은 절대 이 파일에 넣지 말 것 — ~/.zshrc.local (git 미추적)
# =============================================================================

# -----------------------------------------------------------------------------
# [1] 버전 & Alias — 자주 바꾸는 것들이라 최상단에 모아둠
# -----------------------------------------------------------------------------

# 런타임 버전 — brew의 버전 패키지(keg-only)와 짝. 올릴 때: brew install 후 여기 수정
export JAVA_VERSION="21"    # brew openjdk@21
export NODE_VERSION="22"    # brew node@22 (LTS)

# 편집기 — 터미널 빠른 편집은 vim, 메인 에디터는 nvim
export EDITOR="vim"       # kubectl edit, crontab 등 CLI 도구가 사용
alias vi="vim"

# 파일 보기 — 문법 하이라이트되는 cat (파이프/리다이렉트 시 bat이 자동으로 평문 출력)
alias cat="bat --style=plain --paging=never"

# 목록 — eza(ls 대체). 디렉터리 우선 정렬 + git 상태/트리 헬퍼
alias ls="eza --group-directories-first"
alias ll="eza -l --git --group-directories-first"
alias la="eza -la --git --group-directories-first"
alias lt="eza --tree --level=2"

# modern CLI 대체 — 대화형에서 클래식 명령을 modern 도구로. ⚠️ 인터페이스가 달라
# 클래식 문법(find . -name / sed 's///' / du -sh / df -h / ps aux)은 안 먹힘.
# 표준 동작이 필요하면 `command find` 식으로 우회, 스크립트엔 항상 표준 명령. 사용법: ~/.claude/CLAUDE.md
alias grep="rg"    # 재귀·.gitignore 기본 (전부 검색: `rg -uu`)
alias find="fd"    # `fd <패턴>` (정규식/글롭)
alias sed="sd"     # `sd <찾기> <바꾸기>` (정규식)
alias du="dust"    # 디렉터리 용량 트리
alias df="duf"     # 디스크 마운트 표
alias ps="procs"   # 프로세스 목록
alias top="btop"   # 시스템 모니터

# Kubernetes — k=kubecolor(kubectl 출력 색칠 래퍼). 완성은 [4]에서 연결.
# 컨텍스트/네임스페이스 전환은 kubectx / kubens 사용 (필요 시 KUBECONFIG로 대상 지정)
alias k="kubecolor"

# -----------------------------------------------------------------------------
# [2] Powerlevel10k instant prompt — 셸이 다 뜨기 전에 프롬프트를 먼저 그려서
#     체감 시작 속도를 높임. 화면 출력을 만드는 코드는 반드시 이 블록 아래에
#     있어야 함 (위에는 출력 없는 export/alias만 허용)
# -----------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# [3] 환경 변수 & PATH
# -----------------------------------------------------------------------------

# PATH/fpath에 같은 경로가 중복으로 쌓이는 것을 막음 (zsh 내장 기능)
typeset -U path fpath

# Homebrew — HOMEBREW_PREFIX(/opt/homebrew) 정의 + brew 기본 PATH 설정
eval "$('/opt/homebrew/bin/brew' 'shellenv')"

# Java — openjdk@21은 keg-only(brew가 PATH에 자동 연결하지 않음)라 직접 추가
export JAVA_HOME="${HOMEBREW_PREFIX}/opt/openjdk@${JAVA_VERSION}"
export PATH="${JAVA_HOME}/bin:${PATH}"

# Go — 런타임은 brew go. 에디터용 도구(gopls 등)는 nvim Mason이 자동 설치, golangci-lint는 brew.
#      GOPATH는 go install 작업 공간 (bin은 직접 설치하는 도구 대비 PATH 유지)
export GOPATH="${HOME}/Library/Go"
export PATH="${GOPATH}/bin:${PATH}"

# Node — node@22도 keg-only라 직접 추가. 전역 패키지 목록: node/default-npm-packages
export PATH="${HOMEBREW_PREFIX}/opt/node@${NODE_VERSION}/bin:${PATH}"

# Python — brew/PATH 설정 없음: uv 전담.
#   기본 python3 = uv가 ~/.local/bin에 설치한 3.14 (간단한 스크립트용)
#   프로젝트는 uv sync/.venv, CLI 도구는 uv tool install (전역 오염 방지)

# PostgreSQL 클라이언트(psql) — DB 서버는 로컬 설치 대신 docker(colima)로 기동
export PATH="${HOMEBREW_PREFIX}/opt/libpq/bin:${PATH}"

# 사용자 로컬 실행 파일 — uv의 기본 python, uv tool, Claude Code 네이티브 설치 등이 사용
export PATH="${HOME}/.local/bin:${PATH}"

# ls 등 BSD 명령에 색상 표시
export CLICOLOR=1

# 히스토리 — autosuggestions/↑ 검색의 원천. 셸 간 공유 + 중복/민감명령 정리
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY          # 여러 셸(탭) 간 실시간 공유
setopt HIST_IGNORE_ALL_DUPS   # 중복 명령은 이전 것 제거
setopt HIST_IGNORE_SPACE      # 공백으로 시작하는 명령은 기록 안 함 (민감 명령 숨김)
setopt HIST_REDUCE_BLANKS     # 여분 공백 정리 후 저장
setopt EXTENDED_HISTORY       # 실행 시각 함께 기록

# 디렉터리 이동 — 이름만 쳐도 cd, 방문 기록 스택으로 `cd -<Tab>` 점프
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT

# -----------------------------------------------------------------------------
# [4] 자동완성 & 프롬프트 로드
# -----------------------------------------------------------------------------

# zsh 자동완성 초기화 — 전체 파일에서 반드시 1회만 (중복 실행은 시작 지연의 주범)
# fpath에 brew 자동완성 스크립트 경로들을 먼저 등록한 뒤 compinit 실행
fpath=("${HOMEBREW_PREFIX}/share/zsh-completions" "${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath)
autoload -Uz compinit
compinit -i

# 완성 메뉴 튜닝 (fzf-tab도 이 zstyle을 읽어 그룹/색상·미리보기 표시)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # 대소문자 무시 매칭
zstyle ':completion:*' menu no                             # zsh 기본 메뉴 끔 — fzf-tab이 대체
zstyle ':completion:*:descriptions' format '[%d]'          # 그룹 헤더(fzf-tab 그룹 구분)
zstyle ':completion:*' group-name ''                       # 후보를 종류별로 그룹화
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'CLICOLOR_FORCE=1 ls -1p "$realpath"'  # cd 미리보기

# kubectl 자동완성 — 매 시작마다 `source <(kubectl completion zsh)` 하면 느려서
# 캐시 파일로 저장해두고 사용. kubectl 업그레이드 시(바이너리가 더 새것) 자동 재생성
_kubectl_comp="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/kubectl-completion.zsh"
if [[ ! -s "${_kubectl_comp}" || "${commands[kubectl]}" -nt "${_kubectl_comp}" ]]; then
  mkdir -p "${_kubectl_comp:h}"
  kubectl completion zsh > "${_kubectl_comp}"
fi
source "${_kubectl_comp}"
unset _kubectl_comp

# kubecolor(alias k 계열)가 kubectl 자동완성을 그대로 쓰도록 연결 — 완성 로드 뒤에 실행
compdef kubecolor=kubectl

# fzf 셸 통합 — Ctrl-R(히스토리)·Ctrl-T(파일)·Alt-C(디렉터리 이동)
command -v fzf >/dev/null && source <(fzf --zsh)

# fzf-tab — 탭 완성 후보를 fzf UI로. ⚠️ compinit·완성 정의 뒤,
# ZLE 위젯을 감싸는 autosuggestions/syntax-highlighting 앞에 로드
_fzf_tab="${HOMEBREW_PREFIX}/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
[[ -f "${_fzf_tab}" ]] && source "${_fzf_tab}"
unset _fzf_tab

# Powerlevel10k 프롬프트 — 테마 본체 + 개인 설정(zsh/.p10k.zsh의 복사본)
# 모양 변경은 `p10k configure` 실행 후 갱신된 ~/.p10k.zsh를 저장소에 재반영
source "${HOMEBREW_PREFIX}/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme"
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# 히스토리 기반 자동제안 (회색 제안 — → 키로 수락)
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# -----------------------------------------------------------------------------
# [5] 기기 한정 설정 — 시크릿, 회사/기기 전용 값은 ~/.zshrc.local에 (git 미추적)
# -----------------------------------------------------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# 명령어 문법 하이라이트 — ZLE 훅을 감싸는 방식이라 반드시 파일 마지막에 로드
source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
