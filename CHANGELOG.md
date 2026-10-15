# Changelog

What changed in each kubelatch release, newest first, written for the people who run it. The same notes, also in Spanish, are at https://docs.kubelatch.com/releases/. Only the latest release is supported.

## 0.41.0 (2026-10-15)

### New

- In **Agents**, pending approvals can be decided several at a time: tick the rows and approve or deny them with one confirmation. A batch of approvals holds writes of one shape only (the same agent, cluster, tool, resource and namespace), so it reads as one sentence; anything else is still approved one by one, with its diff. The audit records each decision with the batch it was taken in.

## 0.40.0 (2026-10-14)

### New

- When a new version is out, the **Version** row in **Edition** links to what changed in it with **What's new**, next to **How to upgrade**. From this version on, the notes of each release are in [Releases](https://docs.kubelatch.com/releases/), in English and Spanish.
