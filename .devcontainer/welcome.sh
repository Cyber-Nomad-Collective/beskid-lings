#!/usr/bin/env bash
# Printed in the terminal each time you attach to the codespace.
if command -v beskid >/dev/null 2>&1; then
  echo "$(beskid --version) is ready. Start the course with:"
  echo
  echo "    beskid -q run --project Runner"
  echo
else
  echo "Beskid is not installed. See the output of .devcontainer/install-beskid.sh."
fi
