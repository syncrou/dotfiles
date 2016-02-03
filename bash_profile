#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=/Volumes/Macintosh\ HD/Users/dbomhof/bin:/usr/local/bin:$PATH
[[ -s "/Volumes/Macintosh\ HD/Users/dbomhof/.rvm/scripts/rvm" ]] && source "/Volumes/Macintosh\ HD/Users/dbomhof/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Alias file
source ~/bin/dotfiles/alias

export EDITOR='vim'

# Git completion
source ~/bin/dotfiles/git-completion.bash
source ~/bin/dotfiles/git-prompt.sh
source ~/.profile
#source ~/.awscredentials
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '

# Node package manager
export NODE_PATH=/usr/local/lib/node

# Clear out flow control characters <C-s>, <C-q> so VIM has 
#   access to them
stty -ixon -ixoff

