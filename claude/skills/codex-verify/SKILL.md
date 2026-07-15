---
name: codex-verify
description: Cross-verify Claude's work using Codex CLI as an independent second opinion. Use ONLY when the user explicitly names codex — e.g. "codex로 검증해줘", "codex를 사용해서 확인해줘", "verify with codex". Do NOT trigger on generic re-verification requests (재검증, 비판적으로 검증 등) that do not mention codex.
---

# Codex Cross-Verification

Re-verify a conclusion, change, or analysis with Codex CLI — an independent model acting as a skeptical second reviewer.

Core principle: **avoid anchoring**. Give Codex only the raw material (diff, files, failing test, question). NEVER include Claude's own conclusion, reasoning, or fix description in the prompt — an anchored verifier just agrees.

## Procedure

1. Identify the verification target: uncommitted diff / a branch or commit / specific files·functions / a claim or analysis / test results.
2. Run Codex in a read-only sandbox:
   - Code change review (preferred when the target is a diff):
     - `codex exec review --uncommitted` — staged + unstaged + untracked
     - `codex exec review --base <branch>` / `--commit <sha>`
     - Append custom instructions as the PROMPT argument if the review needs focus.
   - Anything else (claims, designs, specific files):
     - `codex exec -s read-only -C <project-root> -o <scratchpad>/codex-verdict.md "<self-contained prompt>"`
     - Write the prompt self-contained: file paths to inspect, the exact question, and the required verdict format (issue list with severity + evidence; explicit "no issues found" allowed).
3. Read Codex's verdict (from the `-o` file for `exec`; stdout for `review`).
4. Compare with your own conclusion: list agreements and disagreements.
5. For each disagreement, re-open the code and re-verify yourself — decide which side is right, with evidence. Do not defer to either side by default.
6. Report in order: agreed findings → disagreements resolved by re-examination → remaining open disagreements.

## Notes

- Always `-s read-only` for `exec` — the verifier must not modify anything.
- Codex runs can take minutes; set a generous Bash timeout (5–10 min).
- If `codex` is not authenticated, tell the user to run `codex login` themselves (interactive).
