export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pizza"

plugins=(git brew tmux python pip django chucknorris history docker thefuck taskwarrior)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim

export PATH="/usr/local/bin:$PATH"

# ALIAS
alias source-apply="source ~/.zshrc"
alias vim=nvim
# alias to fix a lot of python shims on homebrew
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
alias ctags="`brew --prefix`/bin/ctags"
alias cat=bat
alias dark=base16_cisco
alias light=base16_cisco-light
alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# PYTHON
export WORKON_HOME=$HOME/.ve
export PROJECT_HOME=$HOME/repos

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# pyenv virtualenvwrapper_lazy

eval "$(direnv hook zsh)"

# pyenv setup to avoid conflicts
if [ -n "$PYENV_COMMAND" ] && [ ! -x "$PYENV_COMMAND_PATH" ]; then
  versions=($(pyenv-whence "${PYENV_COMMAND}" 2>/dev/null || true))
  if [ -n "${versions}" ]; then
    if [ "${#versions[@]}" -gt 1 ]; then
      echo "pyenv-implicit: found multiple ${PYENV_COMMAND} in pyenv. Use version ${versions[0]}." 1>&2
    fi
    PYENV_COMMAND_PATH="${PYENV_ROOT}/versions/${versions[0]}/bin/${PYENV_COMMAND}"
  fi
fi

# apply base16 script
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# apply fzf script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# viclean similar to pyclean to clean Obsession
function viclean() {
    ZSH_VICLEAN_PLACES=${*:-'.'}
    find ${ZSH_VICLEAN_PLACES} -type f -name "Session.vim" -delete
}

# pytestclean similar to pyclean to clean pytest cache
function pytestclean() {
    ZSH_VICLEAN_PLACES=${*:-'.'}
    find ${ZSH_VICLEAN_PLACES} -type d -name ".pytest_cache" -exec rm -rf {} \;
}

# no idea
if [ -r ~/.not-public ]
then
    source ~/.not-public
fi


# setting terminal color
# TODO add if when changing the color
echo -e "\033]6;1;bg;red;brightness;24\a"
echo -e "\033]6;1;bg;green;brightness;24\a"
echo -e "\033]6;1;bg;blue;brightness;24\a"
