#!/usr/bin/env bash
# Installs the Beskid 0.6.6 toolchain for Linux x86-64 and downloads the matching
# VS Code extension, both from the beskid-lings release `toolchain-0.6.6`.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

release="https://github.com/Cyber-Nomad-Collective/beskid-lings/releases/download/toolchain-0.6.6"
toolchain="beskid-0.6.6-x86_64-unknown-linux-gnu"
toolchain_sha256="b57a416dee5120b14445c349c467cb0be6b99fff356f02cb2d8393a4dc57638c"
extension="beskid-vscode-0.6.6-linux-x64.vsix"
extension_sha256="0b1b2dafcba719661778c838234c4de425d7b4355e021942cad375b606e5ee6b"

# Native builds compile and link with clang.
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq clang build-essential >/dev/null

mkdir -p "${HOME}/.beskid/toolchains" "${HOME}/.beskid/downloads" "${HOME}/.local/bin"
cd "${HOME}/.beskid/downloads"

curl -fsSL -o "${toolchain}.tar.gz" "${release}/${toolchain}.tar.gz"
echo "${toolchain_sha256}  ${toolchain}.tar.gz" | sha256sum -c -
curl -fsSL -o "${extension}" "${release}/${extension}"
echo "${extension_sha256}  ${extension}" | sha256sum -c -

rm -rf "${HOME}/.beskid/toolchains/${toolchain}"
tar -xzf "${toolchain}.tar.gz" -C "${HOME}/.beskid/toolchains"
printf '#!/bin/sh\nexec "%s" "$@"\n' "${HOME}/.beskid/toolchains/${toolchain}/bin/beskid" > "${HOME}/.local/bin/beskid"
chmod +x "${HOME}/.local/bin/beskid"
export PATH="${HOME}/.local/bin:${PATH}"

beskid --version
# Build the runner once so the first start of the course is quick.
cd "${repo}"
beskid -q build --project Runner
