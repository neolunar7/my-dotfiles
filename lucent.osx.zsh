export ZSH="${HOME}/.oh-my-zsh"
export TERM="xterm-256color"
export EDITOR='vim'
export LANG="en_US.UTF-8"
ZSH_THEME="powerlevel10k/powerlevel10k"

# DIRCOLORS
source ${HOME}/.dircolors.zsh

# Plugins
plugins=(git history history-substring-search zsh-autosuggestions zsh-completions zsh-syntax-highlighting fasd k alias-finder copydir docker dotenv osx)

# Pyenv
# export PATH="/usr/local/opt/openssl/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl/include"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# source ${HOME}/.pyenv/plugins/pyenv-autoenv/bin/pyenv-autoenv

# Jupyter
alias jp='jupyter notebook --ip=0.0.0.0 --allow-root' 

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH="${PATH}:${JAVA_HOME}/bin"

# Directory stacks
setopt autopushd pushdminus pushdsilent pushdtohome
DIRSTACKSIZE=8

# Custom binaries
export PATH="${HOME}/.bin:$PATH"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

KEYTIMEOUT=1

# oh-my-zsh
source ${ZSH}/oh-my-zsh.sh

function killport() { lsof -i TCP:$1 | awk '/LISTEN/ {print $2}' | xargs kill -9 }

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Fzf
export PATH=$PATH:~/.fzf/
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
