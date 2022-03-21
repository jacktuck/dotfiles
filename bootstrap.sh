#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

echo 'Installing/Updating Neovim plugins'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

source ~/.zshrc;

./iterm2/setup.sh

export STOW_DIRS=hammerspoon,config,zsh,git,iterm2,tmux,yabai

for dir in $(echo $STOW_DIRS | sed "s/,/ /g"); do
  echo "stowing $dir";
  stow $dir -t ~;
done

stow ubersicht -t "$HOME/Library/Application Support/"

[ ! -d ~/.hammerspoon/stackline ] && git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline

