#!/usr/bin/env bash
# =============================================================================
# my-settings bootstrap — 새 맥 초기화 스크립트 (macOS 전용, 재실행 안전)
#
# 하는 일: Homebrew 설치·패키지 복원 → dotfile 복사(실제 위치 덮어쓰기)
#          → npm 전역 패키지 → VS Code 설정·확장 → 폰트(private/) → 수동 단계 안내
# 사용법: git clone <repo> && cd my-settings && ./bootstrap.sh
# 참고: 심볼릭 링크를 쓰지 않는다 — 저장소 파일을 실제 위치로 복사하며,
#       덮어쓰기 전 기존 파일은 ~/.dotfiles-backup/<일시>/ 에 백업된다.
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

log_info()    { printf '\033[0;34m[INFO]\033[0m %s\n' "$1"; }
log_success() { printf '\033[0;32m[OK]\033[0m %s\n' "$1"; }
log_warn()    { printf '\033[1;33m[WARN]\033[0m %s\n' "$1"; }

[[ "$OSTYPE" == darwin* ]] || { echo "macOS 전용 스크립트입니다."; exit 1; }

# 기존 파일(링크가 아닌 실파일)은 덮어쓰기 전에 백업
backup_file() {
    local file="$1"
    if [[ -e "$file" && ! -L "$file" ]]; then
        mkdir -p "$BACKUP_DIR"
        cp -R "$file" "$BACKUP_DIR/"
        log_warn "백업: $file -> $BACKUP_DIR/"
    fi
}

# 저장소 파일/디렉터리를 실제 위치로 복사 (내용이 같으면 건너뜀)
# 과거 심볼릭 링크 방식의 잔재는 링크를 지우고 실파일로 교체한다
copy_file() {
    local src="$1" dest="$2"
    if [[ ! -L "$dest" ]] && diff -rq "$src" "$dest" >/dev/null 2>&1; then
        log_success "최신 상태: $dest"
        return
    fi
    if [[ -L "$dest" ]]; then
        rm "$dest"
    elif [[ -e "$dest" ]]; then
        backup_file "$dest"
        rm -rf "$dest"
    fi
    mkdir -p "$(dirname "$dest")"
    cp -R "$src" "$dest"
    log_success "복사: $src -> $dest"
}

# -----------------------------------------------------------------------------
# 1. Homebrew + 패키지 (Brewfile)
# -----------------------------------------------------------------------------
if ! command -v brew &>/dev/null; then
    log_info "Homebrew 설치..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
log_info "brew bundle 실행..."
brew bundle --file="$SCRIPT_DIR/Brewfile"

# -----------------------------------------------------------------------------
# 2. Dotfile 복사 — 저장소가 원본, 실제 위치의 파일을 덮어씀
#    (실사용 파일을 직접 수정했다면 저장소 사본에 반영 후 커밋할 것)
# -----------------------------------------------------------------------------
copy_file "$SCRIPT_DIR/zsh/.zshrc"      "$HOME/.zshrc"
copy_file "$SCRIPT_DIR/zsh/.p10k.zsh"   "$HOME/.p10k.zsh"
copy_file "$SCRIPT_DIR/tmux/tmux.conf"  "$HOME/.tmux.conf"
copy_file "$SCRIPT_DIR/vim/.vimrc"      "$HOME/.vimrc"
copy_file "$SCRIPT_DIR/git/.gitconfig"  "$HOME/.gitconfig"
copy_file "$SCRIPT_DIR/git/ignore"      "$HOME/.config/git/ignore"
copy_file "$SCRIPT_DIR/nvim/config"     "$HOME/.config/nvim"

mkdir -p "$HOME/.vim/undodir"   # .vimrc의 undofile 저장 위치

# 기기/개인 한정 git 설정 — 없을 때만 템플릿 생성
if [[ ! -f "$HOME/.gitconfig.local" ]]; then
    cat > "$HOME/.gitconfig.local" << 'EOF'
[user]
    name = YOUR_NAME
    email = YOUR_EMAIL
EOF
    # shellcheck disable=SC2088  # 경로가 아니라 안내 문구
    log_warn "~/.gitconfig.local 생성됨 — user.name / user.email을 채울 것"
fi

# Claude Code 전역 설정 (도구가 실행 중 갱신하는 파일 — 기존 것은 백업 후 덮어씀)
copy_file "$SCRIPT_DIR/claude/settings.json" "$HOME/.claude/settings.json"
copy_file "$SCRIPT_DIR/claude/CLAUDE.md"     "$HOME/.claude/CLAUDE.md"
copy_file "$SCRIPT_DIR/claude/skills"        "$HOME/.claude/skills"

# -----------------------------------------------------------------------------
# 3. npm 전역 패키지 (brew node@22는 keg-only라 경로 직접 사용)
# -----------------------------------------------------------------------------
NPM="$(brew --prefix)/opt/node@22/bin/npm"
if [[ -x "$NPM" ]]; then
    log_info "npm 전역 패키지 설치..."
    grep -v -e '^#' -e '^$' "$SCRIPT_DIR/node/default-npm-packages" | xargs "$NPM" install -g
fi

# -----------------------------------------------------------------------------
# 4. VS Code — 설정 복사 + 확장 목록 기반 설치
# -----------------------------------------------------------------------------
VSCODE_USER="$HOME/Library/Application Support/Code/User"
if [[ -d "$(dirname "$VSCODE_USER")" ]]; then
    mkdir -p "$VSCODE_USER"
    copy_file "$SCRIPT_DIR/vscode/settings.json"    "$VSCODE_USER/settings.json"
    copy_file "$SCRIPT_DIR/vscode/keybindings.json" "$VSCODE_USER/keybindings.json"
fi
if command -v code &>/dev/null; then
    log_info "VS Code 확장 설치..."
    grep -v '^#' "$SCRIPT_DIR/vscode/extensions.txt" | awk 'NF {print $1}' \
        | xargs -L1 code --install-extension
else
    log_warn "code CLI 없음 — VS Code에서 'Shell Command: Install code command' 실행 후 확장 설치"
fi

# -----------------------------------------------------------------------------
# 5. 폰트 — 상용이라 git 미추적. private/를 백업에서 복사해온 경우에만 설치
# -----------------------------------------------------------------------------
FONT_SRC="$SCRIPT_DIR/private/fonts/PragmataProMono Nerd Font"
if [[ -d "$FONT_SRC" ]]; then
    cp -n "$FONT_SRC"/*.ttf "$HOME/Library/Fonts/" 2>/dev/null || true
    log_success "PragmataPro Mono NF 폰트 설치"
else
    log_warn "private/fonts 없음 — 개인 백업에서 private/를 복사한 뒤 재실행 (private/README.md)"
fi

# -----------------------------------------------------------------------------
# 6. 남은 수동 단계
# -----------------------------------------------------------------------------
echo ""
log_success "bootstrap 완료. 남은 수동 단계:"
cat << 'EOF'
  1. gh auth login (github.com / github.nhnent.com 각각) 후 gh auth setup-git
  2. Claude Code 설치: curl -fsSL https://claude.ai/install.sh | bash
     플러그인 설치 명령: claude/plugins.md 참조
  3. iTerm2 프로파일 import: private/iterm/Default.json (Profiles → Other Actions)
  4. nvim 최초 실행 — lazy.nvim 플러그인 + Mason 도구 자동 설치 (nvim/README.md)
  5. 시크릿·기기 한정 셸 설정은 ~/.zshrc.local 에 (git 미추적)
  6. 새 터미널을 열어 프롬프트(p10k)·자동완성 동작 확인
EOF
