# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    tmux
    zsh-syntax-highlighting
    zsh-autosuggestions
    # brew
    # python
    # history
    # docker
    # thefuck
)
source $ZSH/oh-my-zsh.sh
export TERM='screen-256color'

# starship
eval "$(starship init zsh)"

# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "plugins/git",   from:oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export TERM_COLOR_THEME="snazzy"
export PATH="$PATH:$HOME/.local/bin"

# alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cat="bat"
# export BAT_THEME="Nord"
export BAT_THEME="Sublime Snazzy"

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
# nord colors
# --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
# --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
export FZF_DEFAULT_OPTS='
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export PATH="/Users/t.medeiros/src/git-fuzzy/bin:$PATH"
# export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# edit cli with vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line
