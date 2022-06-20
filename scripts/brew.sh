#!/bin/sh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Use latest package definitions
brew update

# Upgrade old packages (if any)
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install essential casks
brew install caskroom/cask/brew-cask

# Utilities
brew cask install alfred
brew cask install dropbox
brew cask install google-backup-and-sync
brew cask install evernote
#brew cask install notion
brew cask install ticktick
brew cask install rescuetime
brew cask install flux
brew cask install anki
brew cask install vlc
brew cask install licecap
brew cask install android-file-transfer
brew install scrcpy
brew cask install teamviewer
brew cask install bettertouchtool
brew cask install the-unarchiver
brew cask install karabiner-elements
brew cask install dozer
brew cask install appcleaner
brew cask install authy
brew cask install macdown
brew cask install calibre
brew install youtube-dl
brew install ffmpeg
brew cask install kap
brew install gabrie30/utils/ghorg # quickly clone entire org repos
brew install switchaudio-osx # used for change audio shortcut

# Internet
brew cask install google-chrome
brew cask install firefox
brew cask install brave-browser
brew cask install franz
brew cask install slack
brew cask install spotify
brew cask install private-internet-access

# Dev
brew cask install java
brew install go
brew cask install iterm2
brew cask install visual-studio-code
brew cask install sublime-text
brew cask install android-studio
brew cask install genymotion
brew cask install jetbrains-toolbox
brew cask install postman
brew cask install dash
brew cask install virtualbox
brew cask install go2shell
brew cask install charles
brew cask install docker
brew install postgres
brew install virtualbox
brew install dep
brew install protobuf
brew install fswatch
brew install zsh-autosuggestions
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
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
brew install python
brew install python3
brew install pipenv
brew install pyenv
brew install pyenv-virtualenv
brew install node
brew install yarn
brew install ruby
brew install wget
brew install git
brew cask install android-sdk
brew cask install android-ndk
brew install rustup
rustup-init

# Remove outdated versions from the cellar
brew cleanup

# No casks available, but still want
# Xcode
# Amphetamine
# Microsoft Office
# Lastpass
# Helium
