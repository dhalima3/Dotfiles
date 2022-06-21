# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
zmodload zsh/zprof

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export TERM="xterm-256color"
# ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

plugins=(
  #git
  #extract
  #pep8
  #pyenv
  #pylint
  #python
  #node
  #npm
  #bower
  #osx
  #brew
  #fasd
  z
  #virtualenv
  zsh-prompt-benchmark
)

# User configuration
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Golang
export GOPATH=$HOME/golang
#export GOROOT=/Users/darylh/golang/go1.18
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

# Python
alias python=python3
alias vi="nvim"

function chpwd() {
  ls
}

# Oh my zsh
source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.zsh/aliases.zsh

#zsh-autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Ignore duplicates in history
setopt HIST_IGNORE_ALL_DUPS

function glop()
{
  git log --graph --color=always --pretty=format:"%C(auto)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 | diff-so-fancy; }; f {}' \
   --bind "alt-j:preview-down,alt-k:preview-up,ctrl-d:preview-page-down,ctrl-u:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show % | vim -') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:55%
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://www.ioannispoulakas.com/2020/02/22/how-to-speed-up-shell-load-while-using-nvm/
# Add default node to path
# export PATH=~/.nvm/versions/node/v14.15.5/bin:$PATH

# Load NVM
# export NVM_DIR=~/.nvm
# [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

#source /Users/darylh/Library/Preferences/org.dystroy.broot/launcher/bash/br
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

#[[ -s "/Users/darylh/.gvm/scripts/gvm" ]] && source "/Users/darylh/.gvm/scripts/gvm"

export PATH="$HOME/.poetry/bin:$PATH"
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
