cd ~/.local/bin
rm -rf nvim-macos
rm ~/.local/bin/nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
tar -xzvf nvim-macos.tar.gz
rm nvim-macos.tar.gz
ln -s ~/.local/bin/nvim-macos/bin/nvim ~/.local/bin/
