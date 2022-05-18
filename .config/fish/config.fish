set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ll "exa --header --long --all --binary --git --group --group-directories-first --icons --tree --level=2"
alias v vim
alias c clear
alias t tmux
alias tl "tmux ls"
alias tn "tmux new -s"
alias ta "tmux a -t"
alias nds "npm run dev:server"
alias nda "npm run dev:assets"
alias g git
alias h heroku
alias hl "heroku logs --tail --app"
alias setup "npm init -y && npm i --save-dev eslint prettier eslint-plug-prettier eslint-config-prettier && touch .eslintrc.json prettier.config.js .prettierignore"
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

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
