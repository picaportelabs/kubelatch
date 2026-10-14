# Examples

Skills for an agent that works on Kubernetes through kubelatch's MCP server. They show how a team can write down a recurring job (find out why something is broken, read a database, check a release) so the agent does it the same careful way each time: read first, name the tools and their order, say when to stop and ask the person, and keep Secret values out of the conversation.

| Skill | What it does |
| --- | --- |
| `skills/incident-triage/` | Read-only triage of a broken workload: pods, rollout, `describe`, events, logs, `top_pods`. |
| `skills/database-diagnostics/` | Read-only SQL on a PostgreSQL in the cluster, through a one-off Job applied with `apply` (it may wait for approval), read with `get_logs` and deleted afterwards. The credential is passed by reference and never shown. |
| `skills/release-check/` | After a deploy: `rollout_status`, the image, the pods, the logs. |

They are examples to adapt, not a product: the names (`postgres-main`, `payments-api`, `<namespace>`) are placeholders, and your clusters, services, Secrets and conventions are not these. Edit them to fit before you rely on them. They assume the kubelatch plugin or the rules in `../rules/` are already in place.

## Using one

In Claude Code, copy the folder into your project's `.claude/skills/`:

```sh
mkdir -p .claude/skills
cp -r integrations/examples/skills/incident-triage .claude/skills/
```

Claude Code loads the skill when a request matches its `description`, so change the triggers to the words your team uses. To make a skill available in every project, copy it to `~/.claude/skills/` instead.

`go test ./integrations/` checks that every kubelatch tool named in backticks in these skills exists in the MCP server.
