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

# Kubernetes
alias k="kubectl"
alias ka="kubectl --kubeconfig ~/.kube/alpha-config.yaml"    # alpha 클러스터
alias k9sa="k9s --kubeconfig ~/.kube/alpha-config.yaml"      # alpha 클러스터 k9s
alias kgpu="kubectl --kubeconfig ~/.kube/gpu-config.yaml"    # GPU 클러스터

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

# -----------------------------------------------------------------------------
# [4] 자동완성 & 프롬프트 로드
# -----------------------------------------------------------------------------

# zsh 자동완성 초기화 — 전체 파일에서 반드시 1회만 (중복 실행은 시작 지연의 주범)
# fpath에 brew 자동완성 스크립트 경로들을 먼저 등록한 뒤 compinit 실행
fpath=("${HOMEBREW_PREFIX}/share/zsh-completions" "${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath)
autoload -Uz compinit
compinit -i

# kubectl 자동완성 — 매 시작마다 `source <(kubectl completion zsh)` 하면 느려서
# 캐시 파일로 저장해두고 사용. kubectl 업그레이드 시(바이너리가 더 새것) 자동 재생성
_kubectl_comp="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/kubectl-completion.zsh"
if [[ ! -s "${_kubectl_comp}" || "${commands[kubectl]}" -nt "${_kubectl_comp}" ]]; then
  mkdir -p "${_kubectl_comp:h}"
  kubectl completion zsh > "${_kubectl_comp}"
fi
source "${_kubectl_comp}"
unset _kubectl_comp

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
