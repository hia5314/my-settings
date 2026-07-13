# my-settings

macOS 개발 환경 설정 저장소. **저장소가 설정의 원본**이며, `bootstrap.sh`가 실제 위치로 복사해 동기화한다. GUI 앱 설치는 brew 밖에서 별도 관리한다 (Brewfile은 CLI·런타임·폰트만).

```sh
git clone https://github.com/hia5314/my-settings.git ~/my-settings
cd ~/my-settings && ./bootstrap.sh
```

## 구조

| 경로 | 내용 | 적용 방식 |
|---|---|---|
| `Brewfile` | brew 패키지 (CLI·런타임·폰트 — GUI 앱 제외) | `brew bundle` |
| `zsh/` | `.zshrc`, `.p10k.zsh` (프롬프트) | 복사 |
| `git/` | `.gitconfig`·전역 `ignore` — user 정보는 `~/.gitconfig.local`로 분리 | 복사 |
| `tmux/` | `tmux.conf` (prefix C-a) | 복사 |
| `vim/` | `.vimrc` — 터미널 빠른 편집용 (메인은 nvim) | 복사 |
| `nvim/` | Neovim 설정 전체 (vendored) — [README](nvim/README.md) · [사용 가이드](nvim/USAGE.md) | 복사 (디렉터리) |
| `node/` | npm 전역 패키지 목록 | `npm install -g` |
| `vscode/` | 설정·키바인딩·확장 목록 | 복사 + `code --install-extension` |
| `claude/` | Claude Code 전역 설정·[플러그인 문서](claude/plugins.md) | 복사 |
| `private/` | 상용 폰트·테마, 사내 자산 — **git 미추적** (개인 백업으로 이전) | 디렉터리 내 README 참조 |

## 관리 원칙

- **저장소가 원본**: 심볼릭 링크 없이 `bootstrap.sh`가 저장소 파일을 실제 위치로 **복사(덮어쓰기)**한다. 덮어쓰기 전 기존 파일은 `~/.dotfiles-backup/<일시>/`에 백업된다.
- **수정 흐름**: 저장소에서 수정 → `./bootstrap.sh` 재실행(또는 해당 파일만 복사) → 커밋. 실사용 파일을 직접 고쳤다면 저장소 사본에 반영해 커밋한다 (반영 없이 bootstrap을 재실행하면 저장소 내용으로 되돌아감).
- **시크릿 금지**: 토큰·기기 한정 값은 `~/.zshrc.local`, `~/.gitconfig.local` (git 미추적, `*.local`)에만 둔다.
- **Python은 uv 전담** (brew python 없음), 나머지 런타임은 brew 전역 단일 버전 — 버전 변경은 `zsh/.zshrc` 최상단.

## 수동 단계 (bootstrap이 못 하는 것)

1. `gh auth login` — github.com과 github.nhnent.com 각각, 이후 `gh auth setup-git`
2. Claude Code 네이티브 설치: `curl -fsSL https://claude.ai/install.sh | bash`
3. `private/`를 개인 백업에서 복사 (폰트·테마·iTerm 프로파일 — 디렉터리 내 README 참조)
4. nvim 최초 실행 (플러그인·LSP 자동 설치)
