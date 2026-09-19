# Personal fork

This plugin is maintained in https://github.com/relsett/herdr-automations.
Upstream: https://github.com/DnzzL/herdr-automations.

## Local behavior

The Herdr client recognizes structured API errors on stderr as well as stdout.
This lets the existing startup retry handle `agent_pane_busy` while a new tab's
shell is loading. Scheduling and retry intervals are unchanged.

The installer builds the checked-out source with Go. It does not download an
upstream release binary, which would omit this fork's changes.

## Installation and maintenance

Install this fork, not upstream:

```sh
herdr plugin install relsett/herdr-automations --ref main
```

The existing plugin ID `dnzzl.automations` preserves the local configuration and
run history. Prompts, schedules, credentials and logs are not in this repository.
`herdr plugin list` records the installed source and commit.

Develop on a fix branch and review upstream updates before merging them. Run
`go test -race ./...`, `go vet ./...`, and `sh scripts/install.sh` before publishing.
Push tested changes to this fork's main branch and reinstall from it. Check an
actual scheduled run before relying on the new version. Restart only this
plugin when needed; do not stop Herdr or unrelated agents.

The existing GitHub CI can also be run manually from the Actions tab.
