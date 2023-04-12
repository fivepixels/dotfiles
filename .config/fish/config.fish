set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias list "exa -a -B -b -i -g -h -l -m -s type -U --git --header --icons"
alias g git
alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.local/state/nvim/lsp.log"
alias gitignore-fix "git rm -rf --cached . && git add"
alias start-coding "echo Let\'s Start Coding! && brew update && brew upgrade"
alias tl "tmux ls"
alias tn "tmux new -s"
alias ta "tmux a -t"
alias tk "tmux kill-session -t"
alias devenv "tmux new -s devenv"

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
