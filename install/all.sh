sh ./touch.sh     # install homebrew
sh ./macconfig.sh # change configurations for mac

# downloading rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
source "$HOME/.cargo/env.fish"

# installing softwares and applications for development
brew install fish ripgrep fd eza -q
brew install node nvm git yarn neovim neovide mysql-client -q
brew install --cask iterm2 github sourcetree pgadmin4 flutter -q
brew install --cask alt-tab rectangle karabiner-elements -q

# installing applications for entertainment and academics
brew install --cask google-chrome -q
brew install --cask discord whatsapp -q
brew install --cask craft miro canva -q
brew install --cask grammarly grammarly-desktop -q
brew install --cask obs -q
brew install --cask microsoft-teams microsoft-word microsoft-outlook microsoft-onenote microsoft-excel microsoft-powerpoint onedrive -q

# install pckr
rm -rf ~/.local/share/nvim/pckr
git clone https://github.com/lewis6991/pckr.nvim --filter=blob:none --branch=stable ~/.local/share/nvim/pckr/pckr.nvim

sh ./fish.sh # install plugins for fish

cd

echo "DONE! Installed everything!"
