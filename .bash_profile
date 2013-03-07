DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

ESC="\033"
NORMAL="\[$ESC[m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

export RUBBER_ENV=staging

export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:$PATH
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export PATH="~/bin:/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin:$PATH"

export DISPLAY=0:0

export CDPATH=".:~:~/dev/reqhub:~/dev::~/Library:"

export PS1="$BLUE\$(date '+%Y-%m-%d %H:%M') $GREEN\w$YELLOW\$(git branch 2>/dev/null|cut -f2 -d\* -s) $GREEN\$ $WHITE"

source ~/.git-completion.bash
source ~/.rake.sh

alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias be="bundle exec"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

