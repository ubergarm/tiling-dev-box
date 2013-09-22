# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias iceweasel='iceweasel > /dev/null 2>&1'
# environment defaults
export EDITOR=vim

# Modified "Kim's mix of those above"
# export PS1='\[\033[01;30m\]\h `if [ $? = 0 ]; then echo "\[\033[01;32m\]^_^"; else echo "\[\033[01;31m\]0_0"; fi` \[\033[00;32m\]\w\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;32m\]$\[\033[00m\]'

# Unmodified "Arne's epic timestammped prompt" with git colors
# export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# Modified "Arne's epic timestammped prompt" with git colors
export PS1='\[\e[01;30m\]\h`if [ $? = 0 ]; then echo "\[\e[32m\] ^_^ "; else echo "\[\e[31m\] 0_0 "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# Set bash to use vi bindings! ESC to enter edit mode by default
set -o vi
