# 전역 사용자 설정 (한국어 참고본)

배포본은 `claude/CLAUDE.md`(영어) — bootstrap이 `~/.claude/CLAUDE.md`로 복사한다. 이 파일은 확인용 한국어판.
**한쪽을 수정하면 반드시 다른 쪽에도 같은 변경을 반영한다.**

## 소통
- **한국어로 답변**한다.
- 결론을 먼저, 근거·트레이드오프는 짧게. 장황한 나열보다 추천안 하나를 제시.
- 확실하면 실행하고 불필요한 재확인·중복 설명은 생략. 되돌리기 어려운 작업만 먼저 확인.

## 작업 스타일 — 미니멀
- 얇고 갈아끼우기 쉬운 구성 선호. 무거운 프레임워크·과한 추상화·불필요한 의존성은 지양.
- 요청 범위를 넘는 변경은 먼저 제안. 기존 파일·설정을 덮기 전 내용을 확인하고, 예상과 다르면 알린다.
- 사용자: NHN ML플랫폼개발팀 · macOS · 주력 도구 Claude Code.

## 주석·문서 작성
영속 문서(README·레포 관리 문서·코드 주석·공식 문서)는 **현재 상태를 보편적으로** 기술한다.
현재 프롬프트/작업에 국한된 서사·변경 이력은 남기지 않는다.
- 판별: *변경 대상이 사라진 뒤 처음 보는 사람에게도 필요한 문장인가?* 아니면 지운다.
- 값·설정은 "지금 무엇을, (필요하면) 왜"만 적는다. "무엇에서 무엇으로 바꿨다"·날짜는
  git 커밋 메시지/CHANGELOG에 둔다.
- 예외(이력 유지): 옛 방식이 아직 공존(마이그레이션 진행 중)하거나 되돌리면 안 되는
  이유가 있을 때 — 이때도 "이력"이 아니라 "현재 유효한 제약/근거"로 적는다.
- 임시 문서(plan·스크래치·작업 메모)는 진행 상황·이력 서술 OK.

## 환경 — modern CLI 도구
이 머신(macOS/Homebrew)엔 클래식 명령의 modern 대체가 설치돼 있다. 명령 실행 시 우선 사용:

| 용도 | 도구 | 대체 | 메모 |
|------|------|------|------|
| 텍스트 검색 | `rg` | grep | 재귀·`.gitignore` 기본, 전부: `rg -uu` |
| 파일 찾기 | `fd` | find | `fd <패턴>` (정규식/글롭) |
| 파일 보기 | `bat` | cat | 문법 하이라이트 |
| 목록 | `eza` | ls | git·트리 |
| 용량 / 디스크 | `dust` / `duf` | du / df | |
| 프로세스 / 모니터 | `procs` / `btop` | ps / top | |
| 치환 | `sd` | sed | `sd <찾기> <바꾸기>` |
| diff | `delta` | diff | git 페이저 |
| JSON / YAML | `jq` / `yq` | | |
| HTTP / 예제 | `xh` / `tldr` | curl / man | |

- 대화형 alias: `cat`·`ls`·`grep`·`find`·`sed`·`du`·`df`·`ps`·`top`·`k` → 위 도구.
  옛 문법(`find . -name`, `du -sh`, `ps aux`)은 안 먹힘 — modern 문법을 쓰고, 표준이 필요하면 `command find`.
- **스크립트 안에서는 표준 POSIX 명령**(grep/find/sed)을 쓴다(이식성). modern 도구는 대화형·일회성만.

## 언어·런타임
- **Python**: `uv` 전담 — brew Python 지양.
  - 프로젝트: `uv sync`/`.venv`, CLI 도구: `uv tool install`.
  - 간단한 일회성 스크립트로 출력만 얻을 땐 기본 `python3`(uv가 `~/.local/bin`에 설치한 것)로 바로 실행해도 됨.
- 그 외: Node(node@22)·Go(brew go)·Java(openjdk@21)+maven — 버전·PATH는 `~/.zshrc`에서 관리.

## 쿠버네티스 / 컨테이너
- `k`=kubecolor(kubectl 색칠). 컨텍스트/네임스페이스: `kubectx`/`kubens`(대상은 `KUBECONFIG`), 탐색 TUI: `k9s`.
- 컨테이너: `lazydocker`(TUI)·`dive`(이미지 레이어), 런타임 colima.

## 시크릿 · git
- 시크릿·기기 한정 값은 **커밋 금지** — `~/.zshrc.local`, `~/.gitconfig.local`(git 미추적)에 둔다.
- GitHub: `github.com`·`github.nhnent.com` 모두 gh CLI로 인증.

## 설정 구조 (참고)
- 개인 설정 원본: `~/my-settings`(bootstrap.sh가 배포). 서비스 워크스페이스: `~/<서비스명>`(템플릿 `my-settings/templates/service-meta`).
