#!/bin/sh
# Build this fork's installed source so upstream binaries cannot omit its fixes.
set -eu

OUT="bin/herdr-automations"
VERSION=$(sed -n 's/^version *= *"\(.*\)"/\1/p' herdr-plugin.toml | head -1)

if ! command -v go >/dev/null 2>&1; then
	echo "herdr-automations: this fork builds from source and requires Go 1.26+." >&2
	echo "Install Go (https://go.dev/dl/) and reinstall the plugin." >&2
	exit 1
fi

mkdir -p bin
echo "herdr-automations: building v${VERSION} from source"
go build -ldflags "-X main.Version=${VERSION}" -o "$OUT" .
