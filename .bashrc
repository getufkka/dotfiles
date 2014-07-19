# Application Shortcuts
alias cot='open -g -a CotEditor' # ターミナルからCotEditorを開く
alias coda='open -g -a Coda' # ターミナルからCodaを開く
alias safari='open -g -a safari' # ターミナルからSafariを開く
alias console='open -a console' # ターミナルからコンソールを開く

# MAMP
alias web='cd /Applications/MAMP/htdocs/' # MAMPのドキュメントルートにジャンプする
alias mysql='/Applications/MAMP/Library/bin/mysql'
alias php5.3='/Applications/MAMP/bin/php5.3/bin/php'

#alias emacs='/Users/suganumatakashi/emacs-24.2/emacs-24.2/emacs-24.2/mac/Emacs.app'

# for shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias ls='ls -GwF'
alias la='ls -alh'
alias t='tar zxvf'
alias t-='tar xvf -'
alias b='bzip2 -dc'
alias dh='df -h'
alias vi='vim'
alias v='vim'
alias sr='screen -d -R'
alias grep='grep --exclude=*.svn*'
alias greprn='grep -rn --exclude=*.svn*'
alias bye='sudo shutdown -h now'

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# for svn
alias st='svn st'
alias stu='svn st -u'
alias sd='svn di'
alias sdi='svn di'
alias sad='svn add'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'

# for git
alias gst='git status'
alias gci='git commit'
alias gdi='git diff'
alias gdc='git diff --cached'
alias gad='git add'

alias pdf='open -a Preview' 
alias finda='open .' 


PATH="$PATH":/Applications
PATH="$PATH”:$HOME/bin
source ~/git-completion.bash

source ~/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1='[\u@\h \W]$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
