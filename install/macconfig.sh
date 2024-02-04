# Dock
defaults write com.apple.dock "orientation" -string "left" && killall Dock
defaults write com.apple.dock "tilesize" -int "20" && killall Dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "static-only" -bool "true" && killall Dock

# Finder
defaults write com.apple.finder "QuitMenuItem" -bool "true" && killall Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" && killall Finder
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" && killall Finder
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" && killall Finder
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int “3” && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true" && killall Finder

# Menu
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true" && killall SystemUIServer
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0"
