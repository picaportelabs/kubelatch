# Changelog

What changed in each kubelatch release, newest first, written for the people who run it. The same notes, also in Spanish, are at https://docs.kubelatch.com/releases/. Only the latest release is supported.

## 0.45.0 (2026-10-18)

### New

- People can now sign in with your company's identity provider over OpenID Connect: Google Workspace, Microsoft Entra ID, Okta, Keycloak, Authentik, Auth0 or any other provider that publishes its discovery document. Each existing account links itself on its first sign-in when the provider vouches for its e-mail address, the CLI keeps signing in through the browser, and once the provider is configured only break-glass accounts keep a password: flag one before you turn it on. The Helm chart takes the provider under `config.oidc`, and its new `extraEnv` adds variables such as `SSL_CERT_FILE` for a provider behind a private CA. See [OIDC login](https://docs.kubelatch.com/operate/oidc/).

## 0.44.0 (2026-10-17)

### New

- A GitHub Actions workflow now gets its kubelatch credential in one step: `uses: picaportelabs/kubelatch-action@v1` with your kubelatch's URL. The action asks GitHub for the job's token, exchanges it, masks the credential and points `KUBECONFIG` at the kubeconfig. The **Workflow snippet** of the **CI** screen and the example in the repository use it. Workflows with the two `curl` steps keep working, and the manual keeps those steps for organisations that allow only their own actions: [Credentials for GitHub Actions](https://docs.kubelatch.com/use/github-actions/).
- Releases are now signed and carry an SBOM: the checksums file of the binaries, the image and the chart are signed with the key printed in [Verify a release](https://docs.kubelatch.com/operate/verify-release/), the binaries come with a CycloneDX SBOM of the server and of the CLI, and the image carries the server's SBOM as a signed attestation. That page shows how to check each one with cosign.

## 0.43.0 (2026-10-16)

### New

- **Audit** and **My activity** now say which command asked for each request: a row reads `patch deployments/api (shop)` followed by **via rollout restart**, and the requests of one kubectl run fold into a single row with its main request, the command and a button that unfolds them. The detail gains **Command** and **Session**, **More filters** gains **Command**, and a row's menu **Only this session**. The command is what kubectl itself declares with every request (kubectl 1.22 or later; always from 1.35); helm, k9s, Lens and kubectl plugins declare none, and their rows stay as they were. Nothing to configure: [Audit and retention](https://docs.kubelatch.com/operate/audit/#where-the-command-comes-from).

## 0.42.0 (2026-10-15)

### Changes

- On a phone, **My access** on **Home** now shows one folded block per cluster, with how many permissions each holds; tap a cluster's header to see its permissions. With permissions on a single cluster the block arrives open. The context to copy and **Kubeconfig** stay visible on every block.
- The local tutorial's `docker-compose.yaml` no longer carries a default version: it runs the release in `KUBELATCH_VERSION`, which step 2 of [Try it locally](https://docs.kubelatch.com/getting-started/local/) now also writes to `.env`, so the server always matches the CLI you downloaded. If you download the new file into a tutorial directory you already have, add that `.env` (`KUBELATCH_VERSION=` and your version) next to it.

## 0.41.0 (2026-10-15)

### New

- In **Agents**, pending approvals can be decided several at a time: tick the rows and approve or deny them with one confirmation. A batch of approvals holds writes of one shape only (the same agent, cluster, tool, resource and namespace), so it reads as one sentence; anything else is still approved one by one, with its diff. The audit records each decision with the batch it was taken in.

## 0.40.0 (2026-10-14)

### New

- When a new version is out, the **Version** row in **Edition** links to what changed in it with **What's new**, next to **How to upgrade**. From this version on, the notes of each release are in [Releases](https://docs.kubelatch.com/releases/), in English and Spanish.
