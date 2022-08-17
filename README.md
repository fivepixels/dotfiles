# Dotfiles

This is my personal dotfiles which are for my Development Environment setup.

**Warnings** : This repo is for only macOS User, If you are windows user, please checkout other dotfiles repository.

## How to Install and configure

### Install

1. Install [Homebrew](https://brew.sh)

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install Applications

   ```bash
   brew install --cask iterm2 google-chrome github sourcetree discord keycastr numi min
   ```

   - [iTerm2](https://iterm2.com/)
   - [Google Chrome](https://www.google.com/chrome/)
   - [Github Desktop](https://desktop.github.com/)
   - [SourceTree](https://www.sourcetreeapp.com/)
   - [Discord](https://discord.com/)
   - [keyCastr](https://github.com/keycastr/keycastr)
   - [numi](https://numi.app/)
   - [min](https://minbrowser.org/)

3. Install Softwares

   ```bash
   brew install node nvm git yarn exa fish neovim tmux heroku && fisher install jethrokuan/z IlanCosman/tide@v5 && git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim && yarn global add diagnostic-languageserver typescript-language-server typescript
   ```

   - [Node](https://nodejs.org/)
   - [nvm](https://github.com/nvm-sh/nvm/)
   - [Git](https://git-scm.com)
   - [Yarn](https://yarnpkg.com/)
   - [exa](https://github.com/ogham/exa)
   - [Fish Shell](https://fishshell.com/)
   - [Neovim](https://neovim.io/)
   - [Tmux](https://github.com/tmux/tmux)
   - [Heroku](https://heroku.com/)
   - [z](https://github.com/jethrokuan/z)
   - [tide](https://github.com/IlanCosman/tide)
   - [Packer](https://github.com/wbthomason/packer.nvim)
   - [diagnostic-lsp](https://github.com/iamcco/diagnostic-languageserver)
   - [Typescript-lsp](https://github.com/typescript-language-server/typescript-language-server)

4. Clone this repository and change directory.

5. Restart your iTerm

6. Install NVIM Plugins

  ```bash
  :PackerInstall
  ```

  - [Plugins List](./.config/nvim/lua/plugins.lua)
