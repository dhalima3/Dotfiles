# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v='f -e vim' # quick opening files with vim
alias o='a -e xdg-open' # quick opening files with xdg-open
alias lvim='/Users/daryl/.local/bin/lvim'

## Shortcuts
alias dl="cd ~/Downloads"
alias p="cd ~/Github"
alias rm="trash"
alias ij="open -b com.jetbrains.intellij"
Alias goland="/usr/local/bin/goland"

# Python
alias python=python3
alias vi="nvim"
alias lvim="~/.local/bin/lvim"

## Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias push='git push'
alias pull='git pull'
alias gc='git commit -m $1'
alias gco='git checkout'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'

## NPM
alias nrd='npm run dev'
