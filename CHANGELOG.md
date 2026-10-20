# Changelog

What changed in each kubelatch release, newest first, written for the people who run it. The same notes, also in Spanish, are at https://docs.kubelatch.com/releases/. Only the latest release is supported.

## 0.46.0 (2026-10-20)

### New

- Native roles give people temporary membership in groups your cluster's own sign-in already knows, with no binding written: the bindings the cluster already has decide what they reach ([Native roles](https://docs.kubelatch.com/operate/roles/#native-roles)). Each cluster can also name people as its SSO does, with an identity template such as `oidc:{email}`, and its page previews the names and flags who can't be named and which names would clash; the default, `user:{login}`, keeps today's names ([Identity in the cluster](https://docs.kubelatch.com/operate/clusters/#identity-in-the-cluster)). When the cluster binds a role's group or a person's name to `cluster-admin`, every permission that gives it needs an expiry of 8 hours at most, checked when granting and again on every reconciliation; such a native role can't be a group permission, and AI agents never receive native roles and keep entering every cluster as `user:<login>`. The cluster's page also lists the groups and users its own bindings name, and the audit detail shows the name each request entered with. Native roles are in every edition and need the current bootstrap manifest ([Update the bootstrap](https://docs.kubelatch.com/operate/clusters/#update-the-bootstrap)).
- With OIDC login, people without an account no longer stop at the login page. Add a domain under Users and whoever signs in with a verified e-mail of that domain gets an account in the group you chose, with an optional expiry for the membership; removing the rule withdraws those memberships and leaves the accounts. Anyone else can ask to join from the page they land on, and an admin approves the request, with a group, a direct permission or nothing, or denies it with a note only admins see. Both respect Free's limit of five people and leave their trail in the control log. Home now walks a newcomer through installing the CLI, getting a permission and a first `kubectl`, ticking each step as it happens. See [Domain access and join requests](https://docs.kubelatch.com/operate/onboarding/). With two or more replicas, finish rolling the new version out to all of them before you change a cluster's identity template or add a domain: until then a replica still on the old version reconciles the same clusters the old way, and the two undo each other's work on every pass.

### Fixes

- Adding people to a group whose permissions include a cluster that doesn't answer now says which group and which cluster, so you know to fix that cluster or remove the group's permission there.

## 0.45.1 (2026-10-18)

### Security

- **High severity. Upgrade now.** Fixes flaws in the server's HTTP and TLS handling through which a client that had not signed in could crash the server, make it use up its memory or CPU, or desynchronise a connection. Every earlier release is affected.

### Fixes

- Signing in with an OpenID Connect provider that signs its ID tokens without a key ID now works, as long as the provider publishes a single signing key.

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
