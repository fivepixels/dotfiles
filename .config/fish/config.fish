set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias list "exa -a  -B -b -i -g -h -l -m -s type -U --git --header --icons"
alias cls "clear"
alias g git

alias tl "tmux ls"
alias tn "tmux new -s"
alias ta "tmux a -t"
alias tk "tmux kill-session -t"

alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.cache/nvim/lsp.log"
alias gitignore-fix "git rm -rf --cached . && git add ."
alias start-coding "brew update"

alias config-project-prettier "echo Watch Here - https://blog.devgenius.io/eslint-prettier-typescript-and-react-in-2022-e5021ebca2b1"
alias config-project-nextjs "echo Watch Here - https://paulintrognon.fr/blog/typescript-prettier-eslint-next-js"

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

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
