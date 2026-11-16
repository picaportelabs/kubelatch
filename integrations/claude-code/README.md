# kubelatch for Claude Code

Let Claude work on your Kubernetes clusters without handing it your kubeconfig. Claude acts as you through [kubelatch](https://kubelatch.com), with only the permissions you give it, for 8 hours by default (24 at most unless your administrators change it), and kubelatch records every request it sends to your clusters. Its writes can wait for your approval, and you can cut it off at any time.

The plugin connects to your team's kubelatch server. If you don't have one yet, the [15-minute local tutorial](https://docs.kubelatch.com/getting-started/local/) runs one on your computer with Docker Compose and kind.

## What you get

- A connection to your kubelatch server's MCP endpoint, `<kubelatch URL>/mcp`. Its tools read objects, logs, events, rollout status and, where metrics-server runs, CPU and memory usage. They also apply and delete objects, scale workloads, restart rollouts, read a Secret's values when Claude asks for them on purpose, and ask you for a role Claude lacks.
- The skill `kubernetes-via-kubelatch`, which tells Claude which tool replaces each `kubectl` command, to start with `whoami`, and what to do with a `403` or an approval.
- A hook that stops `kubectl`, `helm` and `k9s` commands that reach a cluster and tells Claude which kubelatch tool to use instead, or, for `exec` and `port-forward`, to ask you. Commands that don't reach a cluster, such as `helm template` or `kubectl kustomize`, still run. The hook keeps a well-meaning agent on track but can be bypassed: what bounds Claude is the permissions you give it in kubelatch, as long as no other kubeconfig on your computer is within its reach.
- A hook that opens the approval page in your browser when a write or a role Claude asked for waits for you, or the request form when you don't hold that role yet. It works in the VS Code extension and wherever Claude Code runs outside its terminal, on Linux and macOS; in the terminal, Claude Code 2.1.274 and later offers to open the page itself.

## Set it up

1. Install the plugin:

    ```bash
    claude plugin marketplace add picaportelabs/kubelatch
    claude plugin install kubelatch@kubelatch
    ```

    When Claude Code asks for **kubelatch URL**, enter the address kubelatch puts in its links, such as `https://kubelatch.example.com`, without `/mcp` or a trailing slash.
2. The first time Claude needs kubelatch, Claude Code says you have to sign in: run `/mcp`, choose the kubelatch server and sign in. Your browser opens kubelatch's consent page. Choose what Claude gets on each cluster (read only by default) and for how long, and click **Authorize**.
3. Ask Claude to call `whoami`: it lists the clusters it can work on, its role on each, and when its access ends.

Don't also add the server with `claude mcp add`, or Claude will see every kubelatch tool twice.

## Try it

- "Find out why the `web` pod in `shop` keeps failing." Claude reads the pod, its events and its logs; with the read-only default, it can't change anything.
- "Restart the `checkout` deployment in `shop` and tell me when the rollout is done." If you gave Claude a role that writes in `shop`, such as **Same role (developer)**, the restart waits for you (**Writes need my approval** is on unless you turned it off): you see the change, click **Approve**, and it runs once.
- "Create a test Job in `shop`." If Claude's role doesn't allow it, the cluster returns a `403`, and Claude asks you for a role with `request_access`, saying why.

## What it runs and where your data goes

- Claude Code sends each tool call to your kubelatch server at `<kubelatch URL>/mcp`, after you sign in with OAuth in your browser. The result comes back into your conversation, where Claude reads it like any other tool result, including any Secret values `read_secret` returns. Your clusters see each request as you, with only the permissions you gave Claude, and kubelatch's audit log records it as yours, made through Claude.
- The plugin sends nothing to Picaporte Labs and has no telemetry.
- The `kubectl` hook runs on your computer with `sh` and `awk`. It reads every shell command Claude is about to run and refuses the ones above. It makes no network calls; its only output is the refusal Claude reads.
- The approval hook reads what `apply`, `delete_resource`, `scale`, `rollout_restart` and `request_access` return. When the result says a person has to decide, it opens the result's link with `xdg-open` on Linux or `open` on macOS, but only an approval or request page under your kubelatch URL (`/agents/requests/…` or `/request?…`), and shows `kubelatch: opening <link> in your browser` in the session.
- To decide whether to open it, the approval hook reads `CLAUDE_CODE_ENTRYPOINT`, `SSH_CONNECTION`, `DISPLAY` and `WAYLAND_DISPLAY`, and runs `uname`. It opens nothing when Claude Code runs in the terminal, over SSH, on Linux without a display, or on Windows. To turn it off, set **Open approval and request pages in your browser** to off in `/config`.
- The approval hook reads the plugin's two settings from `CLAUDE_PLUGIN_OPTION_KUBELATCH_URL` and `CLAUDE_PLUGIN_OPTION_OPEN_APPROVALS`, which Claude Code sets for it. For the plugin's own tests, `KUBELATCH_HOOK_AWK` and `KUBELATCH_HOOK_OPEN` replace `awk` and the opener.

## If something goes wrong

- Claude sees kubelatch's tools twice: you also added the server with `claude mcp add`. Remove that one with `claude mcp remove <name>`.
- A call says kubelatch needs you to sign in: run `/mcp` and sign in to the kubelatch server.
- A write or a role request is waiting and no page opened: open the link Claude shows you, or go to **Agents** in kubelatch.
- A `403`: Claude's role doesn't allow that there. `whoami` shows what it has, and `request_access` asks you for more.
- A certificate error: Claude Code doesn't trust kubelatch's certificate. Start it with `NODE_EXTRA_CA_CERTS` pointing at kubelatch's CA, as step 14 of the [local tutorial](https://docs.kubelatch.com/getting-started/local/) does.

## Help

The manual covers [AI agents](https://docs.kubelatch.com/use/ai-agents/), every tool on the [MCP server](https://docs.kubelatch.com/reference/mcp/) and [every error kubelatch returns](https://docs.kubelatch.com/reference/errors/). Ask in [Discussions](https://github.com/picaportelabs/kubelatch/discussions) and report bugs in [Issues](https://github.com/picaportelabs/kubelatch/issues); [SUPPORT.md](https://github.com/picaportelabs/kubelatch/blob/main/SUPPORT.md) has Pro support and where to report a vulnerability.

[Privacy](https://kubelatch.com/privacy/) · [License: kubelatch EULA](https://kubelatch.com/terms/)
