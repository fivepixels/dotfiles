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
   brew install fish neovim tmux git node yarn heroku exa && fisher install jethrokuan/z IlanCosman/tide@v5
   ```

   - [Fish Shell](https://fishshell.com/)
   - [Neovim](https://neovim.io/)
   - [Tmux](https://github.com/tmux/tmux)
   - [Git](https://git-scm.com)
   - [Node](https://nodejs.org/)
   - [Yarn](https://yarnpkg.com/)
   - [Heroku](https://heroku.com/)
   - [exa](https://github.com/ogham/exa)
   - [z](https://github.com/jethrokuan/z)
   - [tide](https://github.com/IlanCosman/tide)

4. Clone this repository and change directory.

   ```bash
   git clone https://github.com/Novelier-Webbelier/dotfiles.git
   ```

### Configure

1. iTerm

   1. Create Profile

   2. Go to Appearace > General and change value of Theme from Regular to Minimal

   3. Go to Profiles > Colors and change value of Color Presets from Drak Background to `Solarized Dark`.

      - If `Solarized Dark` button is not exists, Import [this](./Novelier-Webbelier_Iterm2-colors.itermcolors).

   4. Go to Profiles > Window and change value of Transparency and Blur from 0, 0 to 25, 35

2. VIM

   1. Open your VIM and type `:` to run vim command

      ```bash
      :PlugInstall
      ```
3. Restart your iTerm
