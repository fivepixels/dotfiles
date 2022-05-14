# How to Install

Install Applications and Software

## Install HomeBrew for install all of the programs
- Install [HomeBrew](https://github.com/Homebrew)
  - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Install Applications

- Install my most used Applications
  - If you want to searching the applications, visit [here](https://brew.sh) for search.
  - `brew install --cask iterm2 google-chrome github sourcetree discord keycastr numi`

  - WebSites

    - [iTerm2](https://iterm2.com/)
    - [Google Chrome](https://google.com/chrome)
    - [Github Desktop](https://desktop.github.com/)
    - [SourceTree](https://www.sourcetreeapp.com/)
    - [Discord](https://discord.com/)
    - [keycastr](https://github.com/keycastr/keycastr)
    - [numi](https://numi.app/)

## Install Software

- Install Fish, Neovim Tmux, Etc.
  - Cloning Dotfiles 
  - `git clone https://github.com/Novelier-Webbelier/dotfiles.git ~/.dotfiles`

  - Fish, Neovim, Tmux, Git, Fisher
  - `brew install fish neovim tmux git fisher`

  - Tide
  - `fisher install IlanCosman/tide@v5`

  - WebSites

    - [Fish Shell](https://fishshell.com/)
    - [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
    - [Neovim](https://neovim.io/)
    - [Tmux](https://github.com/tmux/tmux)
    - [Git](https://git-scm.com/)
    - [Tide](https://github.com/IlanCosman/tide) - Shell theme. Use version 5: `fisher install ilancosman/tide@v5`


## configure

### Iterm Customize

1. Go to Appearance tab > General and Change value of Theme from Regular to Minimal
2. Go to Profiles tab >  Colors and Change value of Color Presets from Dark Background to Solarized Dark
  - If this button is not exists, install [this](../Solarized Dark - Patched.itermcolors) and Import it
3. Go to Profiles tab > Window and Change value of Transparency and Blur from 0, 0 to 10, 30
