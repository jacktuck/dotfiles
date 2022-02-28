#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

echo 'Installing/Updating Neovim plugins'
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

./iterm2/setup.sh

for dir in $(fd -t d . stow/ | xargs -n 1 basename); do
  echo "stowing $dir";
  stow -R -d stow $dir -t ~;
done

[ ! -d 'Ubersicht' ] && git clone https://github.com/kkga/nibar "Ubersicht/Ubersicht/widgets/nibar"
stow Ubersicht -t "$HOME/Library/Application Support/"

source ~/.zshrc;
