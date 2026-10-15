# Integrations

Files that make an AI agent use kubelatch's MCP server instead of reaching the clusters some other way. How to connect an agent is in the manual: [AI agents](https://docs.kubelatch.com/use/ai-agents/).

| Path | What it is |
| --- | --- |
| `claude-code/` | The Claude Code plugin `kubelatch`: the MCP server (it asks for your kubelatch URL), the skill `kubernetes-via-kubelatch` and a `PreToolUse` hook that refuses `kubectl`, `helm` and `k9s` commands that reach a cluster. This repository is its marketplace: `claude plugin marketplace add picaportelabs/kubelatch`, then `claude plugin install kubelatch@kubelatch`. |
| `rules/kubernetes-via-kubelatch.md` | The same rules for `AGENTS.md` or `CLAUDE.md`: paste it in, or keep it next to them and import it (`@integrations/…` in `CLAUDE.md`). |
| `rules/kubelatch.mdc` | The same rules as a Cursor rule: copy it to `.cursor/rules/`. |
| `examples/` | Three example skills for agents on kubelatch (incident triage, database diagnostics through a one-off Job, release check), to copy into `.claude/skills/` and adapt. See [`examples/README.md`](examples/README.md). |

The rules advise, and the hook is a guardrail for an agent that means well, not a boundary: it can be bypassed, and it runs only in Claude Code. What bounds an agent is the permissions kubelatch gives it.

The three copies of the rules carry the same text.
