# Dotfiles

1. Install [Homebrew](https://brew.sh)

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

   Some errors might appear as you install homebrew. Just follow the instructions that the results give, and command.

2. Install Applications

   ```bash
   brew install --cask iterm2 google-chrome firefox opera min github sourcetree discord keycastr grammarly grammarly-desktop microsoft-teams microsoft-word microsoft-outlook onedrive canva dropzone alt-tab monitorcontrol appcleaner cleanshot rectangle craft whatsapp miro
   ```

   - [iTerm2](https://iterm2.com/)
   - [Google Chrome](https://www.google.com/chrome/)
   - [Firefox](https://www.mozilla.org/en-US/firefox/)
   - [Opera](https://www.opera.com/)
   - [Min](https://minbrowser.org/)
   - [Github Desktop](https://desktop.github.com/)
   - [SourceTree](https://www.sourcetreeapp.com/)
   - [Discord](https://discord.com/)
   - [keyCastr](https://github.com/keycastr/keycastr)
   - [Grammarly](https://grammarly.com/)
   - [Grammarly Desktop](https://grammarly.com/desktop)
   - [Microsoft Teams](https://www.microsoft.com/en-ca/microsoft-teams/group-chat-software)
   - [Microsoft Words](https://www.microsoft.com/en-ca/microsoft-365/word?ms.officeurl=word&rtc=1&activetab=tabs%3afaqheaderregion3)
   - [Microsoft Outlook](https://products.office.com/en-us/outlook/email-and-calendar-software-microsoft-outlook)
   - [OneDrive](https://www.microsoft.com/en/microsoft-365/onedrive/online-cloud-storage)
   - [Canva](https://canva.com/)
   - [DropZone](https://aptonic.com/)
   - [AltTab](https://alt-tab-macos.netlify.app/)
   - [MonitorControl](https://github.com/MonitorControl/MonitorControl/)
   - [Rectangle](https://https://rectangleapp.com/)
   - [AppCleaner](https://freemacsoft.net/appcleaner/)
   - [CleanShot](https://getcleanshot.com/)
   - [Craft](https://craft.do)
     I strongly suggest you to use while taking notes or documenting.
   - [Whatsapp](https://www.whatsapp.com/)
   - [Miro](https://miro.com/)

3. Install Softwares

4. Download basic softwares

   ```bash
   brew install node nvm git yarn exa fish neovim tmux planetscale/tap/pscale mysql-client cmatrix
   ```

5. Download Fisher

   ```bash
   curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
   ```

6. Download Tide

   ```bash
   fisher install jethrokuan/z IlanCosman/tide@v5
   ```

7. Download Packer

   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

8. Install Node global package
   ```bash
   yarn global add diagnostic-languageserver typescript-language-server typescript
   ```

- [Node](https://nodejs.org/)
- [nvm](https://github.com/nvm-sh/nvm/)
- [Git](https://git-scm.com)
- [Yarn](https://yarnpkg.com/)
- [exa](https://github.com/ogham/exa)
- [Fish Shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher)
- [Neovim](https://neovim.io/)
- [Tmux](https://github.com/tmux/tmux)
- [PlanetScale](https://planetscale.com/)
- [MySQL](https://www.mysql.com/)
- [cmatrix](https://github.com/abishekvashok/cmatrix/)
- [z](https://github.com/jethrokuan/z/)
- [tide](https://github.com/IlanCosman/tide/)
- [Packer](https://github.com/wbthomason/packer.nvim/)
- [diagnostic-lsp](https://github.com/iamcco/diagnostic-languageserver/)
- [Typescript-lsp](https://github.com/typescript-language-server/typescript-language-server/)

> If you want to check whether you installed or not, you can check it by printing the version of the sowftwares or opening them.

4. Configure Rectangle

   1. Open the Rectangle App
   2. Click the rightest cog icon
   3. Click `Import` button to set my configuration
   4. Select [RectangleConfig.json](./RectangleConfig.json)

5. Configure Tide

   ```bash
   tide configure
   ```

6. Configure iTerm

   1. Go to [this link](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/readme.md#macos) and [this link](https://github.com/IlanCosman/tide).
   2. Download the latest version of Hack Font and MesloLGS NF Font.
   3. Open them with `Font Book` and click the `Install` button.
   4. Type `Command + ,` to open the Preferences.
   5. Go to `Profile` > `Text` > `Font`, change the font value from `Menlo(Default)` to `Hack Nerd Font Mono`.
   6. Check the `Use ligatures` and `Use a different font for non-ASCII text` toggle button
   7. Select `MesloLGS NF` Font.
   8. Go to `Profile` > `Colors`, change the theme to `Solarized Dark` that is placed bottom right.
   9. Go to `Profile` > `Window`, change the `Trancparency` value to 38, check the `Blur` button, and change the `Blur` value to the max, which is 64.
   10. Go to `Appearance` > `General`, and change the `Theme` to `Minimal`, and `Tab bar location` and `Status bar location` optional button to `Bottom`.

7. Clone this repository and change directory.

8. Open Vim

   1. Type `:PackerInstall` to install all of the plugins that this repository suggest you to use.
      - [Plugins List](./.config/nvim/lua/cattynip/plugins.lua)
   2. Go to [this folder](./.config/nvim/after/plugin/), check all of the files, and change the values to what you would like to use. You might be able to see the link at the top of the files, so you can go to the link to know what this plugin is doing. _This step is optional. You can just use by itself._

9. Restart your computer and start your coding journey.
