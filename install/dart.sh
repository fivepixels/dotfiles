sudo softwareupdate --install-rosetta --agree-to-license

brew tap dart-lang/dart
brew install dart

cd ~/development
unzip ~/Downloads/flutter_macos_arm64_3.13.1-stable.zip

export PATH="$PATH:`pwd`/flutter/bin"

