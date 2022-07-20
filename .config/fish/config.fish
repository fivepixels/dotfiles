set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias lf "exa --header --long --all --binary --git --group --group-directories-first --icons"
alias ls "exa --header --long --all --binary --git --group --group-directories-first --icons --tree --level=3"
alias tl "tmux ls"
alias tn "tmux new -s"
alias ta "tmux a -t"
alias tk "tmux kill-session -t"
alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.cache/nvim/lsp.log"
alias gitignore-not-working "git rm -rf --cached . && git add ."

alias project-init "yarn init && git init"
alias project-config-deep "yarn add -D eslint prettier eslint-config-prettier eslint-plugin-prettier pretty-quick husky && touch .prettierrc.js .prettierignore .eslintrc.js .eslintignore .gitignore .gitattributes AUTHORS.md CONTRIBUTING.md CODE_OF_CONDUCT.md LICENSE && mkdir .github && eslint --init && npx mrm lint-staged"
alias project-config "yarn add -D eslint prettier eslint-config-prettier eslint-plugin-prettier pretty-quick husky && touch .prettierrc.js .prettierignore .eslintrc.js .eslintignore .gitignore && eslint --init && npx mrm lint-staged"

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
