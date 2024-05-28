mkdir -p ~/.bin
cd ~/.bin
rm -f nvim-macos
rm -f ~/.bin/nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-macos-arm64.tar.gz
tar -xzvf nvim-macos-arm64.tar.gz
rm nvim-macos-arm64.tar.gz
ln -s nvim-macos-arm64/bin/nvim ~/.bin/

