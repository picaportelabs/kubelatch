# kubelatch for Claude Code

Let Claude work on your Kubernetes clusters without handing it your kubeconfig. Claude acts as you through [kubelatch](https://kubelatch.com), with only the permissions you give it, for 8 hours by default (24 at most unless your administrators change it), and kubelatch records every request it sends to your clusters. Its writes can wait for your approval, and you can cut it off at any time.

The plugin connects to your team's kubelatch server. If you don't have one yet, the [15-minute local tutorial](https://docs.kubelatch.com/getting-started/local/) runs one on your computer with Docker Compose and kind.

## What you get

- The command `/kubelatch:connect`, which adds your kubelatch server's MCP endpoint, `<kubelatch URL>/mcp`, to Claude Code. Its tools read objects, logs, events, rollout status and, where metrics-server runs, CPU and memory usage. They also apply and delete objects, scale workloads, restart rollouts, read a Secret's values when Claude asks for them on purpose, and ask you for a role Claude lacks.
- The skill `kubernetes-via-kubelatch`, which tells Claude which tool replaces each `kubectl` command, to start with `whoami`, what to do with a `403` or an approval, and not to run `kubectl`, `helm` or `k9s` against a cluster.

## Set it up

1. Install kubelatch from the plugin directory (`/plugin` in Claude Code).
2. Run `/kubelatch:connect` with the address kubelatch puts in its links:

    ```text
    /kubelatch:connect https://kubelatch.example.com
    ```

    Claude asks before it runs `claude mcp add`, which adds the server as `kubelatch` for every project on your computer.
3. Start a new session, run `/mcp`, choose the kubelatch server and sign in. Your browser opens kubelatch's consent page. Choose what Claude gets on each cluster (read only by default) and for how long, and click **Authorize**.
4. Ask Claude to call `whoami`: it lists the clusters it can work on, its role on each, and when its access ends.

## Try it

- "Find out why the `web` pod in `shop` keeps failing." Claude reads the pod, its events and its logs; with the read-only default, it can't change anything.
- "Restart the `checkout` deployment in `shop` and tell me when the rollout is done." If you gave Claude a role that writes in `shop`, such as **Same role (developer)**, the restart waits for you (**Writes need my approval** is on unless you turned it off): open the link Claude shows you, see the change, click **Approve**, and it runs once.
- "Create a test Job in `shop`." If Claude's role doesn't allow it, the cluster returns a `403`, and Claude asks you for a role with `request_access`, saying why.

## What it runs and where your data goes

- The plugin runs nothing on your computer by itself: it holds the skill and the command, both Markdown. `/kubelatch:connect` asks Claude to run `claude mcp get` and `claude mcp add`, and Claude Code asks you before each.
- Claude Code sends each tool call to your kubelatch server at `<kubelatch URL>/mcp`, after you sign in with OAuth in your browser. The result comes back into your conversation, where Claude reads it like any other tool result, including any Secret values `read_secret` returns. Your clusters see each request as you, with only the permissions you gave Claude, and kubelatch's audit log records it as yours, made through Claude.
- The plugin sends nothing to Picaporte Labs and has no telemetry.

## kubelatch's own marketplace

kubelatch's own marketplace has the same plugin with the server built in and two hooks: one stops `kubectl`, `helm` and `k9s` commands that reach a cluster, and one opens the approval page in your browser when a write waits for you. The manual's [AI agents](https://docs.kubelatch.com/use/ai-agents/) page shows how to install it. Install one plugin or the other, not both, or Claude will see every kubelatch tool twice.

## If something goes wrong

- Claude sees kubelatch's tools twice: the server was added twice. `claude mcp list` shows both; remove one with `claude mcp remove <name>`.
- A call says kubelatch needs you to sign in: run `/mcp` and sign in to the kubelatch server.
- A write or a role request is waiting: open the link Claude shows you, or go to **Agents** in kubelatch.
- A `403`: Claude's role doesn't allow that there. `whoami` shows what it has, and `request_access` asks you for more.
- A certificate error: Claude Code doesn't trust kubelatch's certificate. Start it with `NODE_EXTRA_CA_CERTS` pointing at kubelatch's CA, as step 14 of the [local tutorial](https://docs.kubelatch.com/getting-started/local/) does.

## Help

The manual covers [AI agents](https://docs.kubelatch.com/use/ai-agents/), every tool on the [MCP server](https://docs.kubelatch.com/reference/mcp/) and [every error kubelatch returns](https://docs.kubelatch.com/reference/errors/). Ask in [Discussions](https://github.com/picaportelabs/kubelatch/discussions) and report bugs in [Issues](https://github.com/picaportelabs/kubelatch/issues); [SUPPORT.md](https://github.com/picaportelabs/kubelatch/blob/main/SUPPORT.md) has Pro support and where to report a vulnerability.

[Privacy](https://kubelatch.com/privacy/) · [License: kubelatch EULA](https://kubelatch.com/terms/)
