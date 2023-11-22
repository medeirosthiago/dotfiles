
# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# Source zcomet.zsh
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/tmux
zcomet load ohmyzsh plugins/brew
zcomet load ohmyzsh plugins/history
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/docker-compose
zcomet load ohmyzsh plugins/httpie
zcomet load ohmyzsh plugins/python
zcomet load ohmyzsh plugins/pyenv

zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-autosuggestions

zcomet compinit

fpath=($HOME/.zcomet/repos/zsh-users/zsh-completions/src $fpath)

# export SHOW_AWS_PROMPT=false
# export TERM='screen-256color'
export TERM='xterm-256color'
bindkey -e

# hack for macterminal be able to delete-forward
bindkey "\e[3~" delete-char

# avoid command not found: compdef
# autoload -Uz compinit
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C


# starship
eval "$(starship init zsh )"
export STARSHIP_CONFIG=~/.config/starship.toml

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin"
export MYVIMRC="$HOME/.config/nvim/init.lua"

## version dotfile
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias config-nvim='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME nvim +Git'
alias nvimg='nvim +Git +only'

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto -a -s type'
    alias ll='exa -l --color always -a -s type'
fi

export BAT_THEME='Catppuccin-macchiato'
if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp'
fi


# python
# ARCH=`arch`
# if [[ "${ARCH}"  == "arm64" ]]; then
#     export PYENV_ROOT="$HOME/.pyenv/arm64"
# else
#     export PYENV_ROOT="$HOME/.pyenv/rosetta"
# fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

eval "$(direnv hook zsh)"
eval "$(thefuck --alias)"

# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzf_dracula=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

fzf_macchiato=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#a3be8c,fg+:-1,bg+:-1,hl+:#f4dbd6
--color=info:#b48ead,prompt:#a3be8c,pointer:#ed8796,marker:#ed8796,spinner:#f4dbd6
'

fzf_nord=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#a3be8c,fg+:-1,bg+:-1,hl+:#ebcb8b
--color=info:#b48ead,prompt:#a3be8c,pointer:#bf616a,marker:#bf616a,spinner:#ebcb8b
'
export FZF_DEFAULT_OPTS=$fzf_macchiato

# edit cli with vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line

alias luamake=/Users/mdst/src/clones/lua-language-server/3rd/luamake/luamake

eval "$(op completion zsh)"; compdef _op op

# Path for compilers ----
# Path to openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

# Path to readline
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

# Path to sqlite
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# Path to zlib
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

# Path to openldap
export LDFLAGS="-L/opt/homebrew/opt/openldap/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openldap/include"

# Path to curl
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mdst/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mdst/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mdst/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mdst/google-cloud-sdk/completion.zsh.inc'; fi

source /Users/mdst/.docker/init-zsh.sh || true # Added by Docker Desktop

# Poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit

