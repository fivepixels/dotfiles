# Install fish
brew install fish

# Install Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
fisher install jorgebucaran/fisher

# Install Plugins for Fish
fisher install jethrokuan/z IlanCosman/tide@v5

# Configure Tide
tide configure
