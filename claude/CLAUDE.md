# Git Usage Protocol

## 1. Core Restriction
- You are permitted to execute Git commands that inspect the repository or modify the local workspace (e.g., staging files or creating branches). However, you must **never** execute any commands that create commits or interact with the remote repository. This strictly forbids running commands such as `git commit`, `git push`, `git pull`, or `git fetch` yourself.

## 2. Delegation Protocol
- If a task requires committing changes, pushing to a remote, or any other restricted operation, you must not execute the command. Instead, stop and output the exact command(s) in a markdown code block so the user can run them manually.

## 3. Text, Comments, and Commits
- Avoid using non-ASCII characters (e.g., em dashes —) in code comments, logging, or commit messages. Use plain ASCII for code-level text, and standard Markdown for external documentation (PRs, tickets, etc.). Note: This restriction does not apply to AI chat interactions.
- Do not add self-evident comments that merely repeat what the code is doing. Code should be self-documenting wherever possible.
- Do not link or reference issue tracker tickets (e.g., // Fixed in ENG-1234, // This will be solved in ENG-1234, // This was solved on meeting X) directly inside the codebase. Keep ticket context confined to commit messages and PR descriptions.
