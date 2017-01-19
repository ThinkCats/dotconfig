
# vim 8.0
alias vim='/usr/local/bin/vim'
# neovim
#alias vim='/usr/local/Cellar/neovim/0.1.5/bin/nvim'

# git alias
alias gin='git init'
alias gia='git add'
alias gis='git status'
alias gic='git commit -m'
alias gpul='git pull'
alias gpus='git push'

# emacs alias
#alias vim='/usr/local/Cellar/emacs/25.1/bin/emacs'

# rabbitmq
alias rabbitmq_start='brew services start rabbitmq'
alias rabbitmq_stop='brew services stop rabbitmq'


# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# go env
export GOPATH=$HOME/IdeaProjects/Test
export PATH=$PATH:/Users/hehe/develop/apache-maven-3.3.9/bin:$GOPATH/bin
