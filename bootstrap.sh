#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

source zsh/.exports

# Create dirs for code
mkdir -p ~/code ~/projects

# Install brew
#echo "Installing brew"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing stow"
brew install stow

# Stow dotfiles
export STOW_DIRS=config,zsh,git
for dir in $(echo $STOW_DIRS | sed "s/,/ /g"); do
  echo "stowing $dir";
  stow $dir -t ~;
done
