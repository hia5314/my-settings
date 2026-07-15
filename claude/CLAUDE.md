# Global User Settings (~/.claude/CLAUDE.md)

Source: `my-settings/claude/CLAUDE.md` — bootstrap copies this to `~/.claude/CLAUDE.md` (reflect edits back to the repo).
Personal defaults for all projects and sessions. Project-specific rules live in each repo's CLAUDE.md.
A Korean reference copy is kept at `my-settings/claude/CLAUDE.ko.md` — **when either file changes, the other MUST be updated to match.**

## Communication
- **Always respond in Korean.**
- Conclusion first; keep reasoning and trade-offs brief. One recommendation beats a long list of options.
- When confident, act — skip unnecessary re-confirmation and repeated explanations. Confirm first only for hard-to-reverse actions.

## Working Style — Minimal
- Prefer thin, easily replaceable setups. Avoid heavy frameworks, excessive abstraction, and unnecessary dependencies.
- Propose first before changing anything beyond the requested scope. Check existing files/settings before overwriting, and flag anything that differs from expectations.
- User: NHN ML Platform Development Team · macOS · primary tool is Claude Code.

## Comments & Documentation
Persistent documents (README, repo management docs, code comments, official docs) describe the **current state universally**.
Do not leave narratives or change history tied to the current prompt/task.
- Test: *would a first-time reader still need this sentence after the changed target is gone?* If not, delete it.
- For values/settings, write only "what it is now, and (if needed) why". "Changed from X to Y" and dates belong in
  git commit messages / CHANGELOG.
- Exception (keep history): when the old way still coexists (mid-migration) or there is a reason it must not be
  reverted — even then, write it as a "currently valid constraint/rationale", not as history.
- Temporary documents (plans, scratch, work memos) may narrate progress and history.

## Environment — modern CLI tools
This machine (macOS/Homebrew) has modern replacements for the classic commands installed. Prefer them when running commands:

| Purpose | Tool | Replaces | Notes |
|------|------|------|------|
| Text search | `rg` | grep | recursive + `.gitignore` by default; search everything: `rg -uu` |
| File find | `fd` | find | `fd <pattern>` (regex/glob) |
| View file | `bat` | cat | syntax highlighting |
| Listing | `eza` | ls | git status · tree |
| Size / disk | `dust` / `duf` | du / df | |
| Process / monitor | `procs` / `btop` | ps / top | |
| Replace | `sd` | sed | `sd <find> <replace>` |
| diff | `delta` | diff | git pager |
| JSON / YAML | `jq` / `yq` | | |
| HTTP / examples | `xh` / `tldr` | curl / man | |

- Interactive aliases: `cat`·`ls`·`grep`·`find`·`sed`·`du`·`df`·`ps`·`top`·`k` → the tools above.
  Classic syntax (`find . -name`, `du -sh`, `ps aux`) does NOT work — use the modern syntax, or `command find` when the standard command is needed.
- **Inside scripts, use standard POSIX commands** (grep/find/sed) for portability. Modern tools are for interactive/one-off use only.

## Languages & Runtimes
- **Python**: `uv` only — avoid brew Python.
  - Projects: `uv sync`/`.venv`; CLI tools: `uv tool install`.
  - For simple one-off scripts that just produce output, running the default `python3` (installed by uv into `~/.local/bin`) directly is fine.
- Others: Node (node@22) · Go (brew go) · Java (openjdk@21) + maven — versions and PATH are managed in `~/.zshrc`.

## Kubernetes / Containers
- `k` = kubecolor (colorized kubectl). Context/namespace switching: `kubectx`/`kubens` (target via `KUBECONFIG`); exploration TUI: `k9s`.
- Containers: `lazydocker` (TUI) · `dive` (image layers); runtime is colima.

## Secrets · git
- Secrets and machine-specific values must **never be committed** — keep them in `~/.zshrc.local`, `~/.gitconfig.local` (untracked by git).
- GitHub: authenticate both `github.com` and `github.nhnent.com` with the gh CLI.

## Configuration Layout (reference)
- Personal settings source: `~/my-settings` (deployed by bootstrap.sh). Service workspaces: `~/<service>` (template: `my-settings/templates/service-meta`).
