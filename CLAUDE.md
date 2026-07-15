# my-settings

macOS 개발 환경 설정 저장소 — 구조·관리 원칙은 [README.md](README.md) 참조. 저장소가 원본이고 bootstrap.sh가 실제 위치로 복사한다.

## 규칙

- `claude/CLAUDE.md`(영어, 배포본)와 `claude/CLAUDE.ko.md`(한국어, 확인용)는 같은 내용의 이중 언어 쌍이다. **한쪽을 수정하면 반드시 다른 쪽에도 같은 변경을 반영**한다. 배포(bootstrap → `~/.claude/CLAUDE.md`)는 영어본만 된다.
- 여기서 관리하는 파일을 수정하면 실제 위치(`~/.zshrc`, `~/.claude/` 등)에도 반영한다 — 방식은 README의 수정 흐름 참조.
