# drop?
# oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# plugins=(
#     git
#     tmux
#     zsh-syntax-highlighting
#     zsh-autosuggestions
#     aws
#     brew
#     # cask
#     python
#     pyenv
#     history
#     docker
#     docker-compose
#     httpie
#     thefuck
# )
# source $ZSH/oh-my-zsh.sh

export SHOW_AWS_PROMPT=false
# export TERM='screen-256color'
export TERM='xterm-256color'
bindkey -e

# hack for macterminal be able to delete-forward
bindkey "\e[3~" delete-char

# avoid command not found: compdef
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# source <(antibody init)
# antibody bundle < ~/.zsh_plugins.txt
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# starship
eval "$(starship init zsh )"
export STARSHIP_CONFIG=~/.config/starship.toml

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin"
export MYVIMRC="$HOME/.config/nvim/init.lua"

# alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto -a -s type'
    alias ll='exa -l --color always -a -s type'
fi

export BAT_THEME='Nord'
if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp'
fi


alias ezsh="\nvim $HOME/.zshrc"
alias evim="\nvim $HOME/.vimrc"
alias etmux="\nvim $HOME/.tmux.conf"
alias estar="\nvim $HOME/.config/starship.toml"
alias karabina="'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli'"
alias keymac="'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile mac"
alias keymec="'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile mec"
alias keyforty="'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --select-profile forty"
alias zathura="/usr/local/opt/zathura/bin/zathura"

# python
export PYENV_ROOT="$(pyenv root)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(direnv hook zsh)"
eval "$(thefuck --alias)"

# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzf_dracula=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

fzf_nord=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#a3be8c,fg+:-1,bg+:-1,hl+:#ebcb8b
--color=info:#b48ead,prompt:#a3be8c,pointer:#bf616a,marker:#bf616a,spinner:#ebcb8b
'
export FZF_DEFAULT_OPTS=$fzf_nord

export PATH="$HOME/src/clones/git-fuzzy/bin:$PATH"
# edit cli with vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line

# terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/2.0.0/versions/0.12.24/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
GCLOUD_PATH="$HOME/repos/misc-draft/google-cloud-sdk"
if [ -f "${GCLOUD_PATH}/path.zsh.inc" ]; then . "${GCLOUD_PATH}/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${GCLOUD_PATH}/completion.zsh.inc" ]; then . "${GCLOUD_PATH}/completion.zsh.inc"; fi
