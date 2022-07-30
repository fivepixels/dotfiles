set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G -l"
alias la "ls -A"
alias lla "ll -A"

alias tl "tmux ls"
alias tn "tmux new -s"
alias tk "tmux kill-session -t"
alias ta "tmux a -t"

alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.cache/nvim/lsp.log"
alias gitignore-not-working "git rm -rf --cached . && git add ."

alias project-config "yarn add -D prettier eslint eslint-config-prettier eslint-plugin-prettier pretty-quick && touch .prettierrc.js .prettierignore .eslintrc.js .eslintignore .gitignore && npx mrm lint-staged && eslint --init"

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
