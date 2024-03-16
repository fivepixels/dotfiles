set fish_greeting """
Welcome to Fish shell, Cattynip. Enjoy your commands and codes.
"""

export PATH="$PATH:`pwd`/flutter/bin"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

# Theme
set -gx TERM xterm-256color
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Aliases
alias asdf "brew update && brew upgrade"
alias l "eza -a -l -s type --git --header --icons --no-user --no-filesize --no-time"
alias t "eza -a --tree --level"
alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.local/state/nvim/lsp.log && rm -rf ~/.local/state/nvim/swap"
alias to touch
alias mk mkdir
alias cdp "cd ../"
alias g git
alias gitignore-not-working "git rm -rf --cached . && git add ."
alias v nvim
alias nv neovide
alias c clear

# Aliases for Yarn
alias ya "yarn add"
alias yi "yarn install"
alias yr "yarn remove"
alias yc "yarn create"

# Aliases for pnpm
alias p pnpm
alias pi "pnpm install"
alias pr "pnpm remove"

# Aliases for Flutter
alias si "open -a Simulator"
alias fr "flutter run lib/main.dart"
alias fpa "flutter pub add"
alias fpr "flutter pub remove"
alias fpu "flutter pub upgrade"
alias fpg "flutter pub get"

alias renvim "rm -rf /Users/cattynip/.local/share/nvim/ & rm -rf /Users/cattynip/.local/share/nvim.bak/"

# Aliases for web
# alias devmode "open -a GitHub\ Desktop && og"
# start forks 
function start

end

function og
    set -l url "https://github.com"

    if set -q argv[1]
        set url $url/$argv[1]
    end

    if set -q argv[2]
        set url $url/$argv[2]
    end

    open $url -a "Google Chrome"
end

alias o open
alias oy "open https://youtube.com/ -a Google\ Chrome"
alias ogh "open -a GitHub\ Desktop"
alias oa "open https://albertcollege.edsby.com/ -a Google\ Chrome"

set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH node_modules/.bin $PATH
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

#!/usr/bin/fish

# Kanagawa Fish shell theme
# A template was taken and modified from Tokyonight:
# https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 727169 brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
