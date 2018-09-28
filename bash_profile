export PATH=~/.dotfiles/bin:/home/dbomhof/bin:/usr/local/opt/python/libexec/bin:/usr/local/lib/python2.7/site-packages:/usr/local/bin:$PATH

# Alias file
source ~/.dotfiles/alias

export EDITOR='vim'


# Git completion
source ~/.dotfiles/git-completion.bash
source ~/.dotfiles/git-prompt.sh
if [ -f ~/.profile ]; then
    source ~/.source
fi
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '

# Node package manager
export NODE_PATH=/usr/local/lib/node

# Clear out flow control characters <C-s>, <C-q> so VIM has 
#   access to them
stty -ixon -ixoff

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
if [ ! -f /etc/issue ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

export PATH="/usr/local/opt/python/libexec/bin:/Users/dbomhof/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=${JAVA_HOME}/bin:$PATH
