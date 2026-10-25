#!/usr/bin/env bash
# Installs the Beskid 0.6.7-preview.4 toolchain for Linux x86-64 and downloads the
# matching VS Code extension, both from the beskid-lings release
# `toolchain-0.6.7-preview.4`. BESKID_LINGS_ASSETS overrides the download location
# (used to test this script before a release is published).
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

release="${BESKID_LINGS_ASSETS:-https://github.com/Cyber-Nomad-Collective/beskid-lings/releases/download/toolchain-0.6.7-preview.4}"
toolchain="beskid-0.6.7-preview.4-x86_64-unknown-linux-gnu"
toolchain_sha256="aa6c50b353eec44d7f02b930e39af163b8f128334ff2144683e2d065cafd51f5"
extension="beskid-vscode-0.6.7-preview.4-linux-x64.vsix"
extension_sha256="758fb58da484d4ad46b4bfb2d6a47c6ebb4b8fdb829abe8e3365d19bce99c18c"

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
