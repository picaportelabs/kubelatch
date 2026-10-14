# Support

## Where to ask

| For | Where |
| --- | --- |
| Questions, how to do something, ideas | [Discussions](https://github.com/picaportelabs/kubelatch/discussions) |
| Something that doesn't work as the manual says | [Issues](https://github.com/picaportelabs/kubelatch/issues/new/choose), with the bug report form |
| Pro customers | `pro@kubelatch.com`: email support in business hours and guided upgrades |
| A vulnerability | `security@kubelatch.com`, never a public issue: see [SECURITY.md](SECURITY.md) |

The Free edition has community support, here, without a commitment of response. The support that comes with Pro is described at [kubelatch.com/pricing](https://kubelatch.com/pricing/).

## Before you ask

- The manual answers most questions: <https://docs.kubelatch.com>. If you run kubelatch, start with [Troubleshooting](https://docs.kubelatch.com/operate/troubleshooting/); if you use a credential, with [If something fails](https://docs.kubelatch.com/use/troubleshooting/). Every message kubelatch returns is in [Errors](https://docs.kubelatch.com/reference/errors/).
- Only the latest release is supported (the [EULA](LICENSE), section 8). On an older one, [upgrade](https://docs.kubelatch.com/operate/upgrade/) and check whether the problem remains; the [release notes](https://docs.kubelatch.com/releases/) say what each release changed.

## What to put in a bug report

- **The version.** An administrator sees it in the **Version** row of the **Edition** page. Or ask the server:

    ```bash
    kubectl --kubeconfig "$MGMT_KUBECONFIG" -n kubelatch exec deploy/kubelatch -- /kubelatch-server version
    ```

    For the CLI, `kubelatch version`.

- **How it is installed.** The chart version and the values you changed from the defaults; `exposure` (`loadBalancer`, or `ingress` and which controller); your own Postgres or CloudNativePG; the Kubernetes version and distribution of the management cluster and of the cluster involved.
- **What you ran and what it answered.** The exact command and the full error text that `kubectl`, the `kubelatch` CLI or the web interface showed. For a `kubectl` request, the response's `Audit-ID` header (`kubectl -v=8` shows it); for the web interface or the API, the `X-Request-Id` header (the browser's developer tools show it).
- **The `kubelatch-server` log lines around it**, for example:

    ```bash
    kubectl --kubeconfig "$MGMT_KUBECONFIG" -n kubelatch logs deploy/kubelatch --since=15m
    ```

    The lines about one request carry its `audit_id` or `request_id`. [The server log](https://docs.kubelatch.com/operate/troubleshooting/#the-server-log) says what each line holds.

- **What you expected**, with a link to the page of the manual that says so.

Before you paste anything, take out tokens (`klt_…`), kubeconfigs, passwords, `DATABASE_URL`, the encryption key and license keys.
