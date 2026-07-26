#!/bin/sh

# Install Xcode CLT if it isn't already installed
if ! xcode-select -p 1>/dev/null; then
  xcode-select --install
fi

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add homebrew to path
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Use latest package definitions
brew update

# Upgrade old packages (if any)
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Utilities
brew install --cask alfred
brew install --cask ticktick
brew install --cask remnote
brew install --cask flux
brew install --cask anki
brew install --cask vlc
brew install --cask kap
brew install --cask android-file-transfer
brew install scrcpy
brew install --cask bettertouchtool
brew install --cask karabiner-elements
brew install --cask appcleaner
brew install --cask obsidian
brew install --cask nikitabobko/tap/aerospace
brew install --cask selfcontrol
brew install --cask jordanbaird-ice
brew install yt-dlp
brew install ffmpeg
#brew install gabrie30/utils/ghorg # quickly clone entire org repos

# Internet
brew install --cask google-chrome
brew install --cask firefox
brew install --cask brave-browser
brew install --cask discord
brew install --cask spotify
brew install --cask private-internet-access

# Dev
brew install go
brew install --cask temurin@21 # java
brew install --cask iterm2
brew install --cask visual-studio-code
brew install android-platform-tools
#brew install --cask android-studio
#brew install --cask genymotion
brew install --cask postman
brew install --cask virtualbox
brew install --cask charles
brew install --cask docker
brew install postgres
brew install protobuf
brew install fswatch
brew install zsh-autosuggestions
brew install --cask font-fira-code
brew install ripgrep
brew install fzf
brew install dotbot

# Install Dev Homebrews
# Install Xcode before macvim
brew install neovim
brew install tmux
brew install zsh
brew install uv
uv python install --default
uv tool install ty
uv tool install ruff
brew install node
brew install pnpm
brew install ruby
brew install wget
brew install git
brew install git-delta
brew install jj
brew install rustup
rustup default stable

# Remove outdated versions from the cellar
brew cleanup

# No casks available, get in app store:
# Xcode
# Amphetamine
# Klack
# Microsoft Office + Onedrive
# Outread
# Due
# Effortless
# Session Pomodoro Focus Timer
# [Stand](https://getstandapp.com/)
# Bitwarden - install from Bitwarden directly

# Past apps
#brew install --cask slack
#brew install --cask zoom - just use webapp
#brew install --cask notion - just use webapp
#brew install --cask dropbox
#brew install android-commandlinetools
#brew install gradle
#brew install --cask sublime-text
#brew install --cask jetbrains-toolbox
#brew install --cask dash
#brew install virtualbox
#brew install terraform
#brew install --cask macdown
#brew install --cask teamviewer
#brew install --cask rescuetime
#brew install --cask licecap
#brew install --cask the-unarchiver
#brew install switchaudio-osx # used for change audio shortcut
# brew install --cask calibre - install when you actually need it
# brew install --cask postico
