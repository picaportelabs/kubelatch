# Contributing

kubelatch's source code is not published, so this repository takes no contributions to it. What it takes:

- **Issues**: bugs and feature requests, through the forms. [SUPPORT.md](SUPPORT.md) says what a bug report needs.
- **Discussions**: questions, how you use kubelatch, ideas.
- **Pull requests** on [`examples/`](examples/), [`integrations/`](integrations/) and the issue forms in [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/): a fix, or a new example you have run against a real installation.

## How this repository is made

This repository is generated from kubelatch's private repository on every release: each file here is overwritten from there, and a file that isn't there is removed. So a pull request is not merged here: once accepted, the change is applied in the private repository, it reaches this one with the next release, and the pull request is closed.

`README.md`, `SECURITY.md`, `SUPPORT.md`, this file, `CHANGELOG.md`, `LICENSE` and `docs/research/` are overwritten the same way, and they don't take pull requests: for a change to one of them, open an issue.

## Pull requests

- One change per pull request. Say what you ran it against: the kubelatch version and the cluster.
- Name only flags, values and settings that the [manual](https://docs.kubelatch.com) documents, and no secrets: use `kubelatch.example.com` and placeholders.
- The agent rules come in three copies with one body: `integrations/rules/kubernetes-via-kubelatch.md`, `integrations/rules/kubelatch.mdc` and `integrations/claude-code/skills/kubernetes-via-kubelatch/SKILL.md`. Change all three alike.

## License of contributions

Everything here, the examples included, is under the [EULA](LICENSE), whose section 2(d) lets every licensee copy and adapt the examples and agent rules. By opening a pull request, you confirm that the contribution is yours to give, and you let Picaporte Labs use, change and publish it as part of kubelatch under that agreement, without any obligation to you.
