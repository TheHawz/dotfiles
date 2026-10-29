---
name: workmux-workers
description: Use when spawning, messaging, monitoring, or removing workmux workers (Claude Code sessions running in their own git worktree + tmux session). Use alongside the `coordinator` skill.
---

# workmux workers

A workmux worker is a Claude Code session in its own git worktree and tmux session, created by `workmux add`. It is addressed by its handle (the worktree directory name).

Interact with workers only through the `workmux` CLI: `add`, `send`, `capture`, `wait`, `status`, `path`, `run`, `remove`. Not raw `tmux` (`send-keys` with long text left the message unsubmitted in testing). See the `coordinator` skill for the generic flow.

- Spawn from the worker's repo, from a prompt file, based on `origin/main`:
  `workmux add <branch> --base origin/main -b -a "claude --model sonnet" -P <file>`
- Send with `workmux send <handle> --file msg.md` (or inline text). It submits itself.
- A message is not delivered until `workmux capture <handle>` shows the worker acting on it.
- A worker showing `-` in `workmux status`, or "Yes, trust" in `capture`, is stuck on the trust-folder prompt. That decision is the user's.
- `workmux list` only shows the current repo. `status --all`, or targeting the handle directly (`project:handle` if ambiguous), reaches other repos.
- Remove a worker only after its result is posted on the issue/ticket. `remove` needs `-f` for uncommitted files or squash-merged branches.
- The remote blocks force-push: workers fix pushed branches with a follow-up commit or a new branch + PR.
