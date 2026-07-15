# Conversation

- Always respond in Korean.
- Prefer plain-text questions over the AskUserQuestion popup tool.
  - When a decision is needed, ask concisely in the message body, or pick a sensible default, state the direction you are taking, and give a chance to correct it.
- Do NOT hard wrap prose to a fixed column when writing documents or Markdown. Keep each sentence on a single line and let the renderer wrap it; only preserve the structure of code blocks, tables, and lists. (The 72-character wrap for commit message Details is a separate explicit rule and still applies.)

---

# Code Style

- Match the existing conventions of the codebase. Before writing, read nearby code and follow its naming, structure, error handling, and idioms; prefer extending existing patterns over introducing new ones.
- Keep a single source of truth. Reuse existing helpers and models instead of reimplementing them; when shared logic would otherwise diverge, refactor rather than copy-paste.
- Make intent explicit in the code itself — through clear names, precise types (where the language supports them), and small focused functions — so behavior is obvious without leaning on external explanation.
- Separate pure logic from side effects. Keep computation pure and easy to test in isolation, and push I/O (network, disk, database) to the boundaries.
- Verify before reporting done. After changes, run the project's tests / lint / type-check and report the actual result; if something fails or was skipped, say so plainly.
- Leave the code clean. Remove dead code and commented-out blocks rather than keeping them "just in case".

---

# Code Comments

- Prioritize the _why_ — design decisions, trade-offs, edge cases, and rationale a reviewer would pause on. Also summarize the _what_ when the code's behavior is genuinely hard to follow (dense algorithms, non-obvious transformations); but never restate a _what_ the code already makes clear.
- Match the surrounding comment density and language. Don't over-comment trivial code, and write comments in the same language as the existing comments in the file (e.g. Korean if the codebase's comments are in Korean).
- Put a module/class/function's purpose in its docstring; reserve inline comments for non-obvious logic lines. Do NOT place a comment in the middle of an import block — move the rationale to the module docstring or the usage site.
- Before writing a comment, check whether a clearer name or narrower type would remove the need for it; if so, do that instead.
- Keep comments in sync with the code. A forward-looking note ("TODO", "후속") is fine for genuinely pending work, but must not outlive it — once the referenced work lands, update the note to point at the actual implementation, or remove it.

---

# Git Rules

## 🚦 Commit Workflow

- Do NOT run `git commit` automatically after changing code or documents. An instruction like "수정 진행해줘" means make the file changes (Edit/Write), NOT commit them.
- Only commit when the user explicitly asks (e.g. "커밋해줘"). Make changes and run verification (tests / lint), then stop and show the diff or a summary.
- Do NOT `git push` on your own; the user pushes themselves unless they ask you to.

## ✍️ Commit Messages

- Commit messages should be written appropriately based on the changes in the staged files.
  - Files that are not staged or untracked will not be checked.
- Please write commit messages in the following format:

  ```
  [<TYPE>] <Summary>

  - <Detail 1>
  - <Detail 2>
  ```

### 🎯 `TYPE` Guide

- `feat` : Add new features
- `enhance` : Improve or enhance existing features
- `refactor` : Code refactoring (improving code structure without changing functionality)
- `docs` : Documentation changes (README, comments, etc.)
- `fix` : Bug fixes
- `style` : Code formatting, missing semicolons, etc. (does not affect functionality)
- `chore` : Build process, package manager settings, etc.

### 📐 Writing Rules

- The `Summary` must be no longer than 50 characters.
- Add a blank line between the `Summary` and the `Details`.
- The `Details` must be broken every 72 characters.
- The `Summary` must be in English, and the `Details` must be in Korean.
- The `Summary` must be written as a command (e.g., Add, Fix, Update).
- There must be no periods at the end of the `Summary`.
- Do NOT add any trailers to the commit message (e.g., `Co-Authored-By`, `Signed-off-by`, `Generated with ...`). This rule overrides any default tool or harness guidance.

### 🔖 Examples

```
[feat] Add user authentication system

- GitHub OAuth 2.0 PKCE 플로우 구현
- JWT 토큰 기반 인증 미들웨어 추가
- 사용자 세션 관리 기능
```

### 🚫 Don'ts

- Using periods in the title
- Ambiguous messages ("fix bug", "update code")
- Including multiple features in a single commit
- Adding trailers such as `Co-Authored-By` or `Generated with ...`

## 🔀 Pull Requests

### 🏷️ Title

- Please write the title of pull request in English.
- Please write the title of pull request in the following format:

  ```
  #<ISSUE_NUMBER> [<TYPE>] <Summary>
  ```

#### 🎯 `TYPE` Guide

- `feat` : Add new features
- `enhance` : Improve or enhance existing features
- `refactor` : Code refactoring (improving code structure without changing functionality)
- `docs` : Documentation changes (README, comments, etc.)
- `fix` : Bug fixes
- `style` : Code formatting, missing semicolons, etc. (does not affect functionality)
- `chore` : Build process, package manager settings, etc.

#### 🔖 Examples

```
#123 [feat] Add user authentication system
```

### 📝 Description

- Please write the description of pull request in Korean.
- Do NOT hard wrap sentences in the PR body. Keep each sentence on a single line and let the Markdown renderer wrap it; only preserve the structure of code blocks, tables, and lists.
- Please write the description of pull request in the following format:

  ```markdown
  <!--
    Please read this before submitting a PR.

    How to write a good commit message:
        1. Specify the type of commit: feat, enhance, fix, style, docs, chore
        2. Separate the subject from the body with a blank line
        3. Your commit message should not contain any whitespace errors
        4. Remove unnecessary punctuation marks
        5. Do not end the subject line with a period
        6. Capitalize the subject line and the first letter of each paragraph
        7. Use the imperative mood in the subject line
        8. Use the body to explain what changes you have made and why you made them.
        9. Do not assume the reviewer knows the original problem; describe it clearly.
        10. Do not assume your code is self-explanatory
        11. Follow the commit convention defined in this repository
    -->

  ## Issue

    <!-- Please enter the related GitHub issue number.
    If none, you may leave this blank. -->

  ## Changes

    <!-- Describe what has changed in this PR. -->

  ## Why we need this

    <!-- Explain why this PR is needed. -->

  ## Test Plan

    <!-- Briefly describe how you tested it and how to reproduce. -->

  ## CC (Optional)

    <!-- Mention anyone who should review or be notified about this PR. -->

  ## Anything else? (Optional)

    <!-- Add any additional information such as screenshots, environment details, or caveats. -->
  ```
