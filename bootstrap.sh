#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

echo 'Installing/Updating Neovim plugins'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

./iterm2/setup.sh

for dir in $(fd -t d | xargs -n 1 basename); do
  echo "stowing $dir";
  stow $dir -t ~;
done

source ~/.zshrc;
