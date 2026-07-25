#!/usr/bin/env bash

# Exit on command failures, unset variables, or failures within a pipeline.
set -euo pipefail

# Do not launch an interactive Zsh session after installation.
export RUNZSH=no

# Do not change or prompt to change the user's default shell.
export CHSH=no

# Preserve the existing .zshrc because this repository manages it with Dotbot.
export KEEP_ZSHRC=yes

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

p10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [[ ! -d "$p10k_dir/.git" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
fi
