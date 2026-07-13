# Git Rules

## 🌿 Branch Names

| Branch Type | Pattern                     | Examples                           |
| ----------- | --------------------------- | ---------------------------------- |
| Main        | `main`                      |                                    |
| Issue       | `issue/{ISSUE}[-{SUMMARY}]` | `issue/12`, `issue/13-hello-world` |

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
- The `Summary` must be in English, and the `Details` must be in Korean or English.
- The `Summary` must be written as a command (e.g., Add, Fix, Update).
- There must be no periods at the end of the `Summary`.

### 🔖 Examples

```
[feat] Add user authentication system

- GitHub OAuth 2.0 PKCE 플로우 구현
- JWT 토큰 기반 인증 미들웨어 추가
- 사용자 세션 관리 기능
```

### 🚫 Don’ts

- Using periods in the title
- Ambiguous messages ("fix bug", "update code")
- Including multiple features in a single commit

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

- Please write the description of pull request in Korean or English.
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
