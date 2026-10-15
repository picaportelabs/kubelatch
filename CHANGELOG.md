# Changelog

What changed in each kubelatch release, newest first, written for the people who run it. The same notes, also in Spanish, are at https://docs.kubelatch.com/releases/. Only the latest release is supported.

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
