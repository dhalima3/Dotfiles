#!/bin/sh

# Install Xcode CLT if it isn't already installed
if ! xcode-select -p 1>/dev/null; then
  xcode-select --install
fi

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add homebrew to path
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

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
brew install --cask dropbox
#brew install --cask notion
brew install --cask ticktick
brew install --cask remnote
brew install --cask rescuetime
brew install --cask flux
brew install --cask anki
brew install --cask vlc
brew install --cask licecap
brew install --cask kap
brew install --cask android-file-transfer
brew install bitwarden
brew install scrcpy
brew install --cask teamviewer
brew install --cask bettertouchtool
brew install --cask the-unarchiver
brew install --cask karabiner-elements
brew install --cask dozer
brew install --cask appcleaner
brew install --cask authy
brew install --cask macdown
brew install --cask calibre
brew install --cask nikitabobko/tap/aerospace
brew install youtube-dl
brew install ffmpeg
brew install gabrie30/utils/ghorg # quickly clone entire org repos
brew install switchaudio-osx # used for change audio shortcut

# Internet
brew install --cask google-chrome
brew install --cask firefox
brew install --cask brave-browser
brew install --cask slack
brew install --cask zoom
brew install --cask discord
brew install --cask spotify
brew install --cask private-internet-access

# Dev
brew install java
brew install go
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask android-studio
brew install --cask genymotion
brew install --cask jetbrains-toolbox
brew install --cask postman
brew install --cask postico
brew install --cask dash
brew install --cask virtualbox
brew install --cask go2shell
brew install --cask charles
brew install --cask docker
brew install --cask blurred
brew install postgres
brew install virtualbox
brew install dep
brew install protobuf
brew install fswatch
brew install zsh-autosuggestions
brew install romkatv/powerlevel10k/powerlevel10k
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install ripgrep
brew install terraform
brew install grc
brew install fzf
$(brew --prefix)/opt/fzf/install

# Install Dev Homebrews
# Install Xcode before macvim
brew install neovim
brew install tmux
brew install zsh
brew install python3
brew install pipenv
brew install pyenv
brew install pyenv-virtualenv
brew install node
brew install yarn
brew install ruby
brew install wget
brew install git
brew install android-commandlinetools
brew install gradle
brew install rustup
rustup-init

# Remove outdated versions from the cellar
brew cleanup

# No casks available, but still want
# Xcode
# Amphetamine
# Microsoft Office
# Helium
# Due
# Effortless
# Negative PDF Reader
