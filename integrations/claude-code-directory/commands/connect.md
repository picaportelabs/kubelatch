---
description: Connect Claude Code to your kubelatch server, so Claude works on your Kubernetes clusters through it
argument-hint: <kubelatch URL, such as https://kubelatch.example.com>
---

Connect Claude Code to the person's kubelatch server. The address they gave is: $ARGUMENTS

1. If they gave no address, ask for the one they open kubelatch at, such as `https://kubelatch.example.com`, and wait for it.
2. If kubelatch's tools are already available to you (`whoami` among them), the server is already connected, perhaps by kubelatch's own plugin: say so and stop, so Claude Code does not get every tool twice.
3. Check the address. It starts with `https://`, or with `http://` only when the host is exactly `localhost` or `127.0.0.1`, followed by `:` and a port, by `/` or by nothing. So `http://localhost:8080` is fine and `http://localhost.example.com` is not: plain http would send the sign-in across the network unencrypted. Remove a trailing `/mcp` and a trailing `/`. If it holds anything but letters, digits and `-._:/` (a space, a quote, `;`, `&`, `$` or the like), do not use it, since it goes into a shell command: ask again.
4. Run `claude mcp get kubelatch`. If a server named `kubelatch` already points at another address, tell the person and ask before replacing it with `claude mcp remove kubelatch --scope user`. If it points at this address, go to step 6.
5. Run this command, which the person approves, with the address from step 3 in place of `<address>`:

    ```bash
    claude mcp add --transport http --scope user kubelatch <address>/mcp
    ```

    If the `claude` command is not found (some editor installations keep it off the PATH), show the person that line to run in a terminal instead. Add no `Authorization` header and no token: kubelatch signs Claude Code in with OAuth.
6. Tell the person the remaining steps:
    - Start a new Claude Code session, or reload the editor window, so that it loads the server.
    - Run `/mcp`, choose `kubelatch` and sign in. The browser opens kubelatch's consent page: choose what Claude gets on each cluster (read only by default) and for how long, and click **Authorize**.
    - Ask Claude to call `whoami`: it lists the clusters Claude can work on, its role on each and when its access ends.
