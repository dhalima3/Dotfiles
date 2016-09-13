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
brew cask install evernote
brew cask install rescuetime
brew cask install flux
brew cask install vlc
brew cask install licecap
brew cask install android-file-transfer
brew cask install teamviewer
brew cask install bettertouchtool
brew cask install seil

# Internet
brew cask install google-chrome
brew cask install firefox
brew cask install skype
brew cask install franz

# Dev
brew cask install iterm2
brew cask install atom
brew cask install sublime-text
brew cask install android-studio
brew cask install intellij-idea
brew cask install pycharm
brew cask install webstorm
brew cask install postman
brew cask install virtualbox

# Install Dev Homebrews
# Install Xcode before macvim
# brew install macvim --with-lua --custom-icons --override-system-vi
brew install zsh
brew install python
brew install python3
brew install node
brew install ruby
brew install wget
brew install git
brew install android-sdk
brew install android-ndk

# Remove outdated versions from the cellar
brew cleanup
