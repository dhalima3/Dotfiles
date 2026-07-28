#!/usr/bin/env bash

set -euo pipefail

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Install Xcode CLT if it isn't already installed
if ! xcode-select -p 1>/dev/null 2>&1; then
  echo "Xcode Command Line Tools are required. Starting the macOS installer..."
  xcode-select --install

  echo "Complete the Command Line Tools installation in the window that opened."
  echo "This script will continue automatically when the tools are ready."
  echo "Press Ctrl-C to cancel."

  until xcode-select -p 1>/dev/null 2>&1; do
    sleep 10
  done

  echo "Xcode Command Line Tools are ready."
fi

# Install homebrew if it isn't already installed
if ! command -v brew 1>/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Make Homebrew available to the rest of this installer process.
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Use latest package definitions
brew update

# Mac App Store installs require an account signed in through App Store.app.
open -a "App Store"
read -r -p "Sign in to the App Store if needed, then press Return to continue..."

# Install formulae, casks, and Mac App Store apps declared in Brewfile.
brew bundle --file="${BASEDIR}/Brewfile"

# Launch cloud storage apps so their interactive sign-in and setup can finish
# before scripts depend on their synchronized folders.
open -a "OneDrive"
open -a "Google Drive"
echo "Complete the OneDrive and Google Drive sign-in windows."
read -r -p "Wait for both sync folders to appear in Finder, then press Return to continue..."

# Install tools managed by their language-specific package managers.
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
uv python install --default
uv tool install ty
uv tool install ruff
rustup default stable

# Remove outdated versions from the cellar
brew cleanup
