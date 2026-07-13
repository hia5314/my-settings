# my-settings

macOS 개발 환경 설정 저장소. **이 저장소만 clone하면 새 맥에서 동일한 환경이 재현된다**는 원칙으로 관리한다.

```sh
git clone https://github.com/hia5314/my-settings.git ~/my-settings
cd ~/my-settings && ./bootstrap.sh
```

## 구조

| 경로 | 내용 | 적용 방식 |
|---|---|---|
| `Brewfile` | brew 패키지 전체 (CLI·런타임·cask) | `brew bundle` |
| `zsh/` | `.zshrc`, `.p10k.zsh` (프롬프트) | 심볼릭 링크 |
| `git/` | `.gitconfig` — user 정보는 `~/.gitconfig.local`로 분리 | 심볼릭 링크 |
| `tmux/` | `tmux.conf` (prefix C-a) | 심볼릭 링크 |
| `vim/` | `.vimrc` — 터미널 빠른 편집용 (메인은 nvim) | 심볼릭 링크 |
| `nvim/` | Neovim 설정 전체 (vendored) — [README](nvim/README.md) · [사용 가이드](nvim/USAGE.md) | 심볼릭 링크 (디렉터리) |
| `node/` | npm 전역 패키지 목록 | `npm install -g` |
| `vscode/` | 설정·키바인딩·확장 목록 | 복사 + `code --install-extension` |
| `claude/` | Claude Code 전역 지침·설정·[플러그인 목록](claude/plugins.md) | CLAUDE.md는 링크, settings.json은 복사 |
| `private/` | 상용 폰트·테마, 사내 자산 — **git 미추적** (개인 백업으로 이전) | 디렉터리 내 README 참조 |

## 관리 원칙

- **저장소가 원본**: 홈 디렉터리의 dotfile은 이 저장소로의 심볼릭 링크다. 설정 수정 = 저장소 수정 → 커밋.
- **시크릿 금지**: 토큰·기기 한정 값은 `~/.zshrc.local`, `~/.gitconfig.local` (git 미추적, `*.local`)에만 둔다.
- **복사로 관리하는 파일**(VS Code, Claude settings.json)은 도구가 파일을 직접 재작성하기 때문에 링크하지 않는다. 실사용 파일을 수정했으면 저장소 사본에 반영해 커밋한다.
- **Python은 uv 전담** (brew python 없음), 나머지 런타임은 brew 전역 단일 버전 — 버전 변경은 `zsh/.zshrc` 최상단.

## 수동 단계 (bootstrap이 못 하는 것)

1. `gh auth login` — github.com과 github.nhnent.com 각각, 이후 `gh auth setup-git`
2. Claude Code 네이티브 설치: `curl -fsSL https://claude.ai/install.sh | bash`
3. `private/`를 개인 백업에서 복사 (폰트·테마·iTerm 프로파일 — 디렉터리 내 README 참조)
4. nvim 최초 실행 (플러그인·LSP 자동 설치)
