sh ./touch.sh # install homebrew
sh ./macconfig.sh # change configurations for mac

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
brew install --cask microsoft-teams microsoft-word microsoft-outlook microsoft-onenote microsoft-excel microsoft-powerpoint onedrive -q

# install lazy
rm -rf ~/.local/share/nvim/lazy
git clone git@github.com:folke/lazy.nvim.git --filter=blob:none --branch=stable ~/.local/share/nvim/lazy/lazy.nvim

sh ./fish.sh # install plugins for fish

cd

echo "DONE! Installed everything!"
