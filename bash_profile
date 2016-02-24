export PATH=/Volumes/Macintosh\ HD/Users/dbomhof/bin:/usr/local/bin:$PATH

# Alias file
source ~/.dotfiles/alias

export EDITOR='vim'

# Git completion
source ~/.dotfiles/git-completion.bash
source ~/.dotfiles/git-prompt.sh
source ~/.profile
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '

# Node package manager
export NODE_PATH=/usr/local/lib/node

# Clear out flow control characters <C-s>, <C-q> so VIM has 
#   access to them
stty -ixon -ixoff


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
