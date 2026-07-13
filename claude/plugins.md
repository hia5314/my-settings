# Claude Code 플러그인 구성

미니멀 구성 원칙: 공식 마켓플레이스의 LSP 플러그인 + skill-creator만 유지한다.
마켓플레이스는 `claude-plugins-official`(기본)만 사용한다.

## 유지 중인 플러그인

| 플러그인 | 용도 | 설치 명령 |
|---|---|---|
| jdtls-lsp | Java 언어 서버 | `claude plugin install jdtls-lsp@claude-plugins-official` |
| pyright-lsp | Python 언어 서버 | `claude plugin install pyright-lsp@claude-plugins-official` |
| gopls-lsp | Go 언어 서버 | `claude plugin install gopls-lsp@claude-plugins-official` |
| skill-creator | 스킬 제작/평가 도구 | `claude plugin install skill-creator@claude-plugins-official` |

> 신규 팀의 주력 스택이 확정되면 사용하지 않는 언어의 LSP 플러그인은 제거한다.
> (예: Java 중심 팀이면 gopls-lsp 제거 검토)

## 제거한 것 (2026-07-13, 미니멀 재구성)

- `oh-my-claudecode@omc` 플러그인 + npm 전역 `oh-my-claude-sisyphus` (이중 설치 상태였음)
- `harness@harness-marketplace`
- `andrej-karpathy-skills@karpathy-skills`
- OMC 부속물: HUD statusline, `~/.claude/hud/`, `~/.claude/.omc*`, OMC 설치 스킬(deepinit, omc-reference)
- 마켓플레이스 등록: omc, harness-marketplace, karpathy-skills

다시 필요해지면: `claude plugin marketplace add <github-repo>` 후 install.
