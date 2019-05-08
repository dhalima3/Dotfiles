# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

plugins=(git extract pep8 pyenv pylint python node npm bower osx brew fasd z virtualenv)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

function chpwd() {
  ls
}

# Oh my zsh
source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.zsh/aliases.zsh

#zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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
