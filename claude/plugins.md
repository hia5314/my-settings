# Claude Code 플러그인 구성

스코프 원칙: 팀 무관하게 상시 사용 → **user** / 팀·서비스 종속 → **project**(레포 `.claude/settings.json`에 커밋) / 시험 운용 → **local**(`settings.local.json`) 후 승격.

## user scope — 설치됨

| 플러그인 | 용도 | 설치 명령 |
|---|---|---|
| jdtls-lsp | Java 언어 서버 | `claude plugin install jdtls-lsp@claude-plugins-official` |
| pyright-lsp | Python 언어 서버 | `claude plugin install pyright-lsp@claude-plugins-official` |
| skill-creator | 스킬 제작·평가 | `claude plugin install skill-creator@claude-plugins-official` |
| claude-md-management | CLAUDE.md 품질 감사·세션 학습 반영 | `claude plugin install claude-md-management@claude-plugins-official` |
| claude-hud | statusline (서드파티) | `claude plugin marketplace add jarrodwatts/claude-hud` 후 install |

## 후보 — 필요해질 때

| 플러그인 | 시점 | 스코프 |
|---|---|---|
| gopls-lsp / typescript-lsp | Go / FE 작업 재개 시 | user |
| claude-code-setup | 새 서비스 온보딩 시 자동화 추천 (1회성 — 쓰고 제거 가능) | user 임시 |
| plugin-dev | 팀 플러그인·마켓플레이스 제작 기간 (스킬 7 + 검증 에이전트 3) | user (제작 기간) |
| mcp-server-dev | 사내 도구(Dooray 등) MCP 서버 제작 시 | user 임시 |
| huggingface-skills | ML 서비스 워크스페이스 | project (메타 레포) |
| playwright | e2e 필요한 서비스 | project |
| chrome-devtools-mcp | FE 디버깅·성능 트레이스 (playwright=테스트와 상보) | project/local |
| frontend-design | FE 결과물 품질 (스킬 1개, 가벼움) | project (FE 레포) |
| context7 | 라이브러리 문서 조회가 잦은 프로젝트 | local 시험 → project |
| grafana-mcp | 팀 관측 스택이 Grafana일 때 (self-hosted 연결) | project |
| sonarqube | 사내 품질 게이트가 SonarQube일 때 | project |
| terraform | IaC 작업 시 | project |
| redis-development | 서비스가 Redis 사용 시 (외부 소스 — 설치 시 내용 검증) | project |
| duckdb-skills | 로컬 데이터 파일 분석이 잦아지면 (외부 소스 — 설치 시 내용 검증) | user |
| session-report | 세션 토큰·캐시 사용 분석이 궁금할 때 | user 일시 |
| langfuse | 팀이 LLM 트레이싱을 Langfuse로 할 때 | project |

## 미설치로 확정

내장 기능·기존 도구로 대체되어 설치하지 않는다:

| 플러그인 | 대체 수단 | 비고 |
|---|---|---|
| code-simplifier | 내장 `/simplify` | 에이전트 1개짜리 플러그인, JS 기준 예시 하드코딩 |
| code-review · pr-review-toolkit · feature-dev | 내장 `/code-review` `/review` | 멀티에이전트 리뷰·기능 개발 워크플로 중복 |
| ralph-loop | 내장 `/loop` + 세션 내 장시간 자율 지속 | Stop 훅이 상주해 상시 설치 부적합. 예외: 완료를 기계적으로 검증 가능한 대규모 반복 작업 기간만 local로 설치 후 제거 |
| github MCP | `gh` CLI (github.nhnent.com 포함) | |
| serena · greptile · lumen | LSP 플러그인 + 내장 검색 | 코드 탐색·분석 역할 중복 |
| sourcegraph | LSP + 내장 검색 | 사내 Sourcegraph 인스턴스가 생기면 재검토 |
| desktop-commander | 내장 Bash·Read/Write | 터미널·파일 MCP — 완전 중복 |
| remember | 내장 auto memory | 대화 메모리 — 중복 |
| exa · tavily · firecrawl 등 웹 검색/스크랩 계열 | 내장 WebSearch/WebFetch | 대량 크롤링 니즈가 생기면 그때 재검토 |

서드파티 마켓플레이스는 `claude plugin marketplace add <github-repo>` 후 install.
