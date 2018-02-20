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
brew cask install rescuetime
brew cask install flux
brew cask install anki
brew cask install vlc
brew cask install licecap
brew cask install android-file-transfer
brew cask install airdroid
brew cask install cleanmymac
brew cask install teamviewer
brew cask install bettertouchtool
brew cask install the-unarchiver
brew cask install seil
brew cask install appcleaner
brew cask install macdown
brew install youtube-dl
brew install ffmpeg

# Internet
brew cask install google-chrome
brew cask install firefox
brew cask install skype
brew cask install franz
brew cask install slack
brew cask install jadengeller-helium
brew cask install spotify
brew cask install google-play-music-desktop-player
brew cask install music-manager
brew cask install amazon-drive
brew cask install odrive
brew cask install private-internet-access

# Dev
brew cask install java
brew cask install iterm2
brew cask install atom
brew cask install sublime-text
brew cask install android-studio
brew cask install genymotion
brew cask install intellij-idea
brew cask install pycharm
brew cask install webstorm
brew cask install postman
brew cask install dash
brew cask install virtualbox
brew install virtualbox
brew install zsh-autosuggestions

# Install Dev Homebrews
# Install Xcode before macvim
brew install macvim --with-override-system-vim
brew install tmux
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

# No casks available, but still want
# Xcode
# Amphetamine
# Wunderlist
# Microsoft Office
# Pomodoro Time
# Lastpass
