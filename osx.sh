#!/bin/bash

[ $(read_yn "Install Jupyter") == "Y" ] && {
    python3 -m pip install jupyterlab
    EXPRESSION="alias jp='jupyter notebook --ip=0.0.0.0 --allow-root'"
    echo $EXPRESSION >> ~/.zshrc 
}

[ $(read_yn "Install oh-my-zsh and powerlevel10k") == "Y" ] && {
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-completions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k
    curl -fsSL https://github.com/supermarin/powerline-fonts/raw/master/Monaco/Monaco%20for%20Powerline.otf \
            > "/Library/Fonts/Monaco for Powerline.otf"
    curl -fsSL https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Regular/complete/Meslo%20LG%20S%20Regular%20Nerd%20Font%20Complete%20Mono.ttf \
            > "/Library/Fonts/Meslo LG S Regular Nerd Font Complete Mono.ttf"
    curl -fsSL https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Italic/complete/Meslo%20LG%20S%20Italic%20Nerd%20Font%20Complete%20Mono.ttf \
            > "/Library/Fonts/Meslo LG S Italic Nerd Font Complete Mono.ttf"
    curl -fsSL https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/S/Bold/complete/Meslo%20LG%20S%20Bold%20Nerd%20Font%20Complete%20Mono.ttf \
            > "/Library/Fonts/Meslo LG S Bold Nerd Font Complete Mono.ttf"
    curl -fsSL https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/S/Bold-Italic/complete/Meslo%20LG%20S%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf \
            > "/Library/Fonts/Meslo LG S Bold Italic Nerd Font Complete Mono.ttf"
    ln -s $(pwd)/p10k.zsh ${HOME}/.p10k.zsh
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
    ln -s $(pwd)/lucent.osx.zsh ${HOME}/.zshrc
}

[ $(read_yn "Install Pyenv") == "Y" ] && {
    curl -fsSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    git clone git://github.com/andersoncardoso/pyenv-autoenv.git ${HOME}/.pyenv/plugins/pyenv-autoenv

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    source ${HOME}/.pyenv/plugins/pyenv-autoenv/bin/pyenv-autoenv

    PYTHON_LATEST="$(pyenv install -l | egrep '^[ \t3]+\.[0-9.]+$' | tail -n 1)"
    PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install ${PYTHON_LATEST}
    pyenv global ${PYTHON_LATEST}
    pyenv local ${PYTHON_LATEST}
    pyenv shell ${PYTHON_LATEST}
}

[ $(read_yn "Install JVM") == "Y" ] && {
    brew tap AdoptOpenJDK/openjdk
    brew cask install adoptopenjdk8
}

[ $(read_yn "Install Scala") == "Y" ] && {
    brew install scala
    brew install sbt
}

[ $(read_yn "Install Spark") == "Y" ] && {
    brew install wget
    wget http://apache.tt.co.kr/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
    tar -xvzf ./spark-2.4.5-bin-hadoop2.7.tgz
    mv ./spark-2.4.5-bin-hadoop2.7.tgz /opt/spark
}
