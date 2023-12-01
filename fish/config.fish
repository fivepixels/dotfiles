set fish_greeting """
Welcome to Fish shell, Cattynip. Enjoy your commands and codes.
"""

export PATH="$PATH:`pwd`/flutter/bin"

# Theme
set -gx TERM xterm-256color
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Aliases
alias asdf "brew update && brew upgrade && flutter upgrade"
alias l "eza -a  -l -s type --git --header --icons --no-user --no-filesize --no-time"
alias t "find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.local/state/nvim/lsp.log"
alias to touch
alias mk mkdir
alias cdp "cd ../"
alias g git
alias gitignore-not-working "git rm -rf --cached . && git add ."
alias v nvim
alias c clear

# Aliases for Flutter
alias si "open -a Simulator"
alias fr "flutter run lib/main.dart"
alias fpa "flutter pub add"
alias fpr "flutter pub remove"
alias fpu "flutter pub upgrade"
alias fpg "flutter pub get"

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
