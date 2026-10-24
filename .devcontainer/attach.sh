#!/usr/bin/env bash
# Runs each time VS Code attaches: installs the Beskid extension once, then
# prints how to start the course.
extension="${HOME}/.beskid/downloads/beskid-vscode-0.6.6-linux-x64.vsix"
if command -v code >/dev/null 2>&1 && [ -f "${extension}" ]; then
  if ! code --list-extensions 2>/dev/null | grep -q '^beskid\.beskid-vscode$'; then
    code --install-extension "${extension}" --force >/dev/null 2>&1 \
      && echo "Installed the Beskid VS Code extension. Run 'Developer: Reload Window' once to activate it."
  fi
fi
if command -v beskid >/dev/null 2>&1; then
  echo "$(beskid --version) is ready. Start the course with:"
  echo
  echo "    beskid -q run --project Runner"
  echo
else
  echo "Beskid is not installed; see the creation log of this codespace."
fi
