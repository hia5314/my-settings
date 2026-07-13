# Claude Code 플러그인 구성

2026-07-13 설정 전체 초기화 — **현재 설치·활성 플러그인 없음**
(마켓플레이스는 기본 `claude-plugins-official`만 등록된 상태).

## 다시 필요할 때 (참고)

| 플러그인 | 용도 | 설치 명령 |
|---|---|---|
| jdtls-lsp | Java 언어 서버 | `claude plugin install jdtls-lsp@claude-plugins-official` |
| pyright-lsp | Python 언어 서버 | `claude plugin install pyright-lsp@claude-plugins-official` |
| gopls-lsp | Go 언어 서버 | `claude plugin install gopls-lsp@claude-plugins-official` |
| skill-creator | 스킬 제작/평가 도구 | `claude plugin install skill-creator@claude-plugins-official` |

서드파티 마켓플레이스는 `claude plugin marketplace add <github-repo>` 후 install.

## 제거 이력 (2026-07-13)

미니멀 재구성 시 제거:

- `oh-my-claudecode@omc` 플러그인 + npm 전역 `oh-my-claude-sisyphus` (이중 설치 상태였음)
- `harness@harness-marketplace`, `andrej-karpathy-skills@karpathy-skills`
- OMC 부속물: HUD statusline, `~/.claude/hud/`, `~/.claude/.omc*`, OMC 설치 스킬(deepinit, omc-reference)
- 마켓플레이스 등록: omc, harness-marketplace, karpathy-skills

이후 설정 전체 초기화로 공식 LSP 3종·skill-creator도 미설치 상태가 되었다 (위 표 참조).
