# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# environment defaults
export EDITOR=vim

# Pretty GIT enabled bash prompt:
export PS1='\[\033[01;30m\]\h `if [ $? = 0 ]; then echo "\[\033[01;32m\]^_^"; else echo "\[\033[01;31m\]0_0"; fi` \[\033[00;32m\]\w\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;32m\]$\[\033[00m\]'

