# Dotfiles

This is my personal dotfiles which are for my Development Environment setup.

If you want to configure my development enviroment, please read howto directory where you can see how to install and configure.

**Warnings** : This repo is for only macOS User, If you are windows user, please checkout other dotfiles repository.

## How to Install and configure

### Install

1. Install [Homebrew](https://brew.sh)

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install Applications

   ```bash
   brew install --cask iterm2 google-chrome github sourcetree discord keycastr numi
   ```

- [iTerm2](https://iterm2.com/)
- [Google Chrome](https://www.google.com/chrome/)
- [Github Desktop](https://desktop.github.com/)
- [SourceTree](https://www.sourcetreeapp.com/)
- [Discord](https://discord.com/)
- [keyCastr](https://github.com/keycastr/keycastr)
- [numi](https://numi.app/)

3. Install Softwares

   ```bash
   brew install fish neovim tmux git node yarn heroku
   ```

- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/)
- [Tmux](https://github.com/tmux/tmux)
- [Git](https://git-scm.com)

4. Clone this repository and change directory.

   ```bash
   git clone https://github.com/Novelier-Webbelier/dotfiles.git
   ```

### Configure

1. iTerm

1. Create Profile

1. Go to Appearace > General and change value of Theme from Regular to Minimal

1. Go to Profiles > Colors and change value of Color Presets from Drak Background to `Solarized Dark`

   - If `Solarized Dark` button is not exists, Import [this](./Novelier-Webbelier_Iterm2-colors.itermcolors).

1. Go to Profiles > Window and change value of Transparency and Blur from 0, 0 to 10, 30

1. VIM

1. Open your VIM and type `:` to run vim command

   ```bash
   :PlugInstall
   ```

1. Install Coc Extensions

1. Open your VIM and type below

- Reference : [Here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions) you can watch all of the coc extensions

  ```bash
  :CocInstall coc-html coc-htmldjango coc-htmlhint coc-html-css-support coc-css coc-cssmodules coc-tsserver
  :CocInstall @yaegassy/coc-pylsp coc-pyright coc-python
  :CocInstall coc-flutter coc-go coc-golines coc-sourcekit
  :CocInstall coc-prettier
  :CocInstall coc-json coc-xml coc-yaml coc-snippets
  ```

3. Restart your iTerm
