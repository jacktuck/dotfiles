#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

echo 'Installing/Updating Neovim plugins'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

source ~/.zshrc;

export STOW_DIRS=config,zsh,git,tmux,yabai

for dir in $(echo $STOW_DIRS | sed "s/,/ /g"); do
  echo "stowing $dir";
  stow $dir -t ~;
done

