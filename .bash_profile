source ~/.bash/aliases
source ~/.bash/colors
source ~/.bash/completions
source ~/.bash/functions

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

export EDITOR=vi

export PS1="$BLUE\$(date '+%Y-%m-%d %H:%M') $GREEN\w$YELLOW\$(git branch 2>/dev/null|cut -f2 -d\* -s) $GREEN\$ $WHITE"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

