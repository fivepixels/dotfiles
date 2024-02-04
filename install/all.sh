# DEVELOPMENT

brew install ripgrep fd eza postgresql@16 fish
brew install node nvm git yarn neovim neovide mysql-client
brew install --cask iterm2 github sourcetree pgadmin4 flutter
brew install --cask alt-tab rectangle karabiner-elements

brew install --cask google-chrome firefox opera min arc
brew install --cask discord whatsapp
brew install --cask craft miro canva
brew install --cask grammarly grammarly-desktop
brew install --cask microsoft-teams microsoft-word microsoft-outlook microsoft-onenote microsoft-excel microsoft-powerpoint onedrive

# install fira fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# install lazy
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim

# install fish
fish ~/.config/install/fish/plugins.sh

# install flutter
brew remove dart
brew remove dart-sdk
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license
xcodebuild -downloadPlatform iOS

# install dart
sudo softwareupdate --install-rosetta --agree-to-license

brew tap dart-lang/dart
brew install dart

cd ~/development
unzip ~/Downloads/flutter_macos_arm64_3.13.1-stable.zip

export PATH="$PATH:$(pwd)/flutter/bin"

# set mac defaults
sh ./macconfig.sh

cd

echo "DONE! Installed everything!"
echo "If you want to install fish plugins, you may have to open the fish shell by typing 'fish' and install them by typing '
# Install Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
fisher install jorgebucaran/fisher

# Install Plugins for Fish
fisher install jethrokuan/z IlanCosman/tide@v5

# Configure Tide
tide configure
'"
