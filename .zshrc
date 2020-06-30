# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mahalo"
plugins=(git brew python history docker tmux thefuck)
source $ZSH/oh-my-zsh.sh

# starship
# eval "$(starship init zsh)"

# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "plugins/git",   from:oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin"

# alias
alias cat="bat"
export BAT_THEME="Nord"

alias vim="\nvim"
alias vi="\vim"

# python
export PYENV_ROOT="$(pyenv root)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook zsh)"
eval "$(thefuck --alias)"

# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='
    --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
    --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

# edit cli with vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line



# zplug "~/.zsh", from:local

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# # Then, source plugins and add commands to $PATH
# zplug load --verbose
