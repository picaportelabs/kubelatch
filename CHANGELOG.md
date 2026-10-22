# Changelog

What changed in each kubelatch release, newest first, written for the people who run it. The same notes, also in Spanish, are at https://docs.kubelatch.com/releases/. Only the latest release is supported.

## 0.48.0 (2026-10-22)

### Before you upgrade

- Before upgrading, find the permissions that give privileged access, which now need an expiry of 8 hours at most from when they were granted: those of developer, debugger, admin, secrets-reader and the custom roles that run workloads (exec and attach included), read or write Secrets, or write ConfigMaps, on a privileged namespace; those of a native role whose group the cluster gives privileged access; and, on a cluster with an identity template other than the default, those of a person whose name the cluster gives privileged access. A namespace is privileged when it is protected or when one of its ServiceAccounts has privileged access, such as power over the whole cluster, reading every Secret, `edit` in `kube-system` or changing the labels of namespaces, as those of Argo CD, Flux, cert-manager, ingress-nginx or Grafana do; when the cluster gives that to every ServiceAccount, every namespace is ([Privileged namespaces](https://docs.kubelatch.com/concepts/native-sso/#privileged-namespaces)). An expiry can't be shortened: revoke each such permission and grant it again with 8 hours at most. A group permission of one of those roles is refused whatever its expiry: revoke it and grant the role to each person; a permission inherited from a group can't be revoked on its own, so remove the person from the group or revoke the group permission. Otherwise, after the upgrade, a single such permission cuts that access for everyone who shares it, and the cluster shows the cause. Then check **What this cluster knows** on each cluster.

### Security

- **Medium severity.** An administrator could give access with the power of cluster-admin for longer than 8 hours: through a native role whose group the cluster binds to another role with that power, or through a role that runs workloads in a namespace whose ServiceAccounts hold it. kubelatch now reads what the cluster's roles allow and applies the 8-hour rule to every name that gets privileged access, its own roles included, and **What this cluster knows** says which names are privileged and why. If you script the API, the fields that said whether a name is cluster-admin are now `privileged` and `privileged_groups`.

### New

- Each cluster shows its provider (Amazon EKS, Google Kubernetes Engine, Azure Kubernetes Service, DigitalOcean Kubernetes, Red Hat OpenShift, K3s, RKE2 or Kubernetes) on its card and on its page. kubelatch works it out on every reconcile, also for clusters registered before this version, and an administrator can set it by hand on the cluster's page when it guesses wrong. See [Clusters](https://docs.kubelatch.com/operate/clusters/).
- kubelatch now warns people before a permission expires. In its last hour (its last quarter, for a permission shorter than 4 hours), `kubectl` and every Kubernetes client print a warning that says when the access ends, and AI agents get the same sentence through the MCP. The bell shows everyone the permissions that end within 24 hours. With e-mail set up (`KUBELATCH_RESEND_API_KEY`), each person also gets an e-mail 24 hours before the end (a quarter of its duration before, for a permission of two days or less), which they can turn off in **My account**. It all works in Free. See [Notifications](https://docs.kubelatch.com/operate/notifications/).

### Changes

- Invitation and reset links can now be e-mailed in Free too: with `KUBELATCH_RESEND_API_KEY` and `KUBELATCH_MAIL_FROM` set, **Send by e-mail** works in every edition, with the same hourly limits. If a script reads `features` from `GET /api/me`, it no longer lists `email_links`.
- Join requests that were approved, denied, cancelled or expired are deleted once they are older than `KUBELATCH_AUDIT_RETENTION`, as the audit is.

### Fixes

- A burst of join requests from one address no longer blocks sign-ins from it, and the other way round: asking to join has its own limit.
- Saving a cluster's identity template no longer waits while other changes to the cluster are in flight: it saves at once, or answers within two seconds that the cluster is busy and you can try again.

## 0.47.0 (2026-10-21)

### Before you upgrade

- A permission created through the API without `expires_at`, or with `"expires_at": null`, now expires after 30 days, like one made in the web interface; until now it never expired. To create one with no end date, send `"never_expires": true`; sending it together with `expires_at` is refused. Choosing **Never** in the web interface still creates one with no end date; reload the browser tabs that were open before the upgrade, because a page loaded earlier sends **Never** as a 30-day permission. Scripts that relied on the missing field to grant permanent access must add it.

### Security

- **Medium severity.** Someone able to intercept kubelatch's outgoing connections, to your identity provider, GitHub, the mail service or a cluster, could make kubelatch accept a forged certificate issued under a certificate authority that is no longer trusted. This release fixes it; earlier releases are affected.

### New

- The sign-in screen now shows each provider's logo on its button (Google, Microsoft, Okta, Auth0 and GitHub), all with the same weight, so no provider stands out as the preferred one, even when there is only one. kubelatch recognises the provider from `OIDC_ISSUER`; for an issuer on your own domain, set `OIDC_ICON` to `google`, `microsoft`, `okta`, `auth0` or `generic`. In the chart it is `config.oidc.icon`.
- In every form that grants a role, native roles now have their own section, showing the cluster groups each one sends. In a group's permissions, and in the first permission of a domain rule, a native role the group cannot take on the chosen cluster, because one of its groups is bound there to cluster-admin, is disabled with the reason before you pick it, so you no longer find out when you save. A group's permissions list the cluster groups of its native roles, and the detail of a permission says which cluster groups the person enters with and the name they enter the cluster as, or why they have none. See [Grant a native role](https://docs.kubelatch.com/operate/roles/#grant-a-native-role).

### Fixes

- An account that the cluster's identity template can't name, such as one without a verified e-mail on a cluster that names people by it, no longer puts the cluster in error. The cluster stays ready and everyone else keeps working; the cluster's page lists those accounts and the clusters list counts them. Those accounts get a 403 on that cluster, and the cluster's identity preview says why for each. See [Accounts that can't be named](https://docs.kubelatch.com/operate/clusters/#accounts-that-cant-be-named).

## 0.46.1 (2026-10-20)

### Fixes

- When an account signs in through GitHub or your OpenID Connect provider, the dialog for a new linking link now says "Send linking e-mail" on its button instead of "Send reset e-mail".

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
