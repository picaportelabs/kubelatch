# Security

## Reporting a vulnerability

Write to **security@kubelatch.com** with what you found, how to reproduce it and the version. We acknowledge within 3 business days, keep you informed, and publish a fix and an advisory; we ask for 90 days of coordinated disclosure. Please do not open a public issue for a vulnerability.

In scope: the kubelatch software (server, CLI, image, chart, plugin), kubelatch.com, docs.kubelatch.com and licensing.kubelatch.com. Out of scope: denial of service, social engineering, and customers' own instances.

## Supported versions

The latest release. Upgrade notes are in the [changelog](CHANGELOG.md) and the manual.

## How kubelatch is built

One impersonating proxy in front of your clusters, a credential per person, pipeline and agent, an audit row per request, a license key verified offline and no telemetry: <https://docs.kubelatch.com/concepts/security/>. The image is distroless and runs as a non-root user; the chart's defaults are the hardened ones.

## Review under NDA

The source code is not public. A prospective customer can review it under NDA: `pro@kubelatch.com`. An external penetration test is planned; its summary will be published at <https://kubelatch.com/security/>.
