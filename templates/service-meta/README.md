# service-meta 템플릿

여러 레포로 구성된 서비스를 하나의 워크스페이스(메타 레포)로 관리하는 스캐폴드.
Claude Code 세션은 이 디렉터리에서 시작한다.

## 왜 이 구조인가 — 팀 영역과 개인 영역의 분리

팀을 옮겨도 유연하게 일하려면 설정의 층이 섞이지 않아야 한다.
팀에 속한 것은 팀 레포에, 나에게 속한 것은 my-settings에, 그 사이의 서비스 컨텍스트는 메타 레포에.

| 층 | 위치 | 원본·공유 | 팀 이동 시 |
|---|---|---|---|
| **개인 영역** | `~/.claude/` — settings·CLAUDE.md·agents·skills | 원본은 `~/my-settings/claude/` | 그대로 유지 |
| **서비스 영역** | 메타 레포(이 스캐폴드) = 세션 진입점 | 로컬 git — 원하면 팀 레포로 공유 | 새로 만들고, 옛것은 `~/workspace/`로 아카이브 |
| **팀 영역** | 각 제품 레포의 `CLAUDE.md`·`.claude/` + 팀 플러그인 | 팀 레포 커밋 · 팀 마켓플레이스 | 레포 클론(+플러그인 설치)이 곧 하네스 적용 |
| **로컬 예외** | `.claude/settings.local.json`·`CLAUDE.local.md` | gitignore | 버린다 |

새 자산(스킬·에이전트·규칙)을 어디에 둘지는 두 질문으로 정한다:

1. **팀을 떠나도 쓰는가?** → 개인 영역 (my-settings에 반영해 원본화)
2. **팀원이 같이 쓰면 좋은가?** → 팀 영역 (제품 레포 커밋 또는 팀 플러그인)
3. 둘 다 아니면 (이 서비스에서 나만) → 서비스 영역(메타 레포) 또는 로컬 예외

## 동작 원리 — 하네스가 진입점에 있어야 하는 이유

- 하위 레포의 `CLAUDE.md`와 `.claude/skills/`는 그 레포 파일을 건드리는 순간
  자동으로 따라 올라온다(lazy-load). → 컨텍스트는 레포에 둬도 된다.
- settings·hooks·플러그인(`enabledPlugins`)·MCP는 **진입 디렉터리 것만** 적용되고
  하위로 내려가지 않는다. → 하네스는 세션을 시작하는 이 레벨에 둔다.

## 새 서비스 시작

```sh
cp -R ~/my-settings/templates/service-meta ~/<서비스명>
cd ~/<서비스명>
git init && git add -A && git commit -m "init: <서비스명> 워크스페이스"
# clone.sh의 REPOS 배열을 채우고 ./clone.sh 로 하위 레포 클론
```

인스턴스화 후 이 README는 서비스 설명으로 교체한다.

## 채워 넣을 것

| 파일 | 내용 |
|---|---|
| `CLAUDE.md` | 서비스 개요·레포 목록·규칙 — 세션 시작 시 항상 로드 |
| `.claude/settings.json` | permissions 합집합, hooks, 팀 플러그인 (`enabledPlugins` / `extraKnownMarketplaces`) |
| `clone.sh` | 하위 레포 remote 목록 (새 장비 복원용) |
| `.gitignore` | 하위 디렉터리 전체 ignore — 추적할 디렉터리만 `!/<dir>/`로 명시 |
