#!/usr/bin/env bash
# Installs the Beskid CLI and language server pinned by BESKID_CLI_TAG and
# BESKID_LSP_TAG (see devcontainer.json). beskid-lings needs Beskid 0.6.7 or later.
set -euo pipefail

cli_tag="${BESKID_CLI_TAG:-cli-v0.6.7}"
lsp_tag="${BESKID_LSP_TAG:-lsp-v0.6.7}"
release_url="https://github.com/Cyber-Nomad-Collective/beskid_compiler/releases/download/${cli_tag}/cli-version.txt"

if ! curl -fsSL -o /dev/null "${release_url}" 2>/dev/null; then
  echo "Beskid release ${cli_tag} is not published yet."
  echo "beskid-lings needs Beskid 0.6.7 or later. See https://beskid-lang.org/downloads/"
  exit 1
fi

curl -fsSL https://beskid-lang.org/install.sh | BESKID_RELEASE_TAG="${cli_tag}" bash
export PATH="${HOME}/.beskid/bin:${PATH}"
grep -q '.beskid/bin' "${HOME}/.bashrc" || echo 'export PATH="$HOME/.beskid/bin:$PATH"' >> "${HOME}/.bashrc"

beskid dev lsp install --release-tag "${lsp_tag}"
beskid --version
beskid doctor || true

# Build the runner once so the first `beskid -q run --project Runner` starts quickly.
beskid -q build --project Runner
