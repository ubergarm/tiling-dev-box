# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias iceweasel='iceweasel > /dev/null 2>&1'

# remove dos/windows line feeds '\r'
alias dos2unix="sed 's/^M$//'"

# environment defaults
export EDITOR=vim

# Modified "Kim's mix of those above"
# export PS1='\[\033[01;30m\]\h `if [ $? = 0 ]; then echo "\[\033[01;32m\]^_^"; else echo "\[\033[01;31m\]0_0"; fi` \[\033[00;32m\]\w\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;32m\]$\[\033[00m\]'

# Unmodified "Arne's epic timestammped prompt" with git colors
# export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '
#
# Martin's root prompt
# export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;35m\]\h\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;31m\]\n>\[\033[00m\] '
#
# Modified "Arne's epic timestammped prompt" with git colors
export PS1='\[\e[01;30m\]\h`if [ $? = 0 ]; then echo "\[\e[32m\] ^_^ "; else echo "\[\e[31m\] 0_0 "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# Set bash to use vi bindings! ESC to enter edit mode by default
set -o vi

# ssh-agent stuff from http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
     #/usr/bin/ssh-add ~/.ssh/id_rsa.others
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# make ansible not use cowsay by default, yes seriously
# http://docs.ansible.com/faq.html
export ANSIBLE_NOCOWS=1

# Setup python virtualenv
[ -s $HOME/projects/virtualenv/bin/activate ] && source $HOME/projects/virtualenv/bin/activate # This loads NVM
# Setup Node Version Manager (like python virtualenv)
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
# Setup docker scripts env -- a bit hacky for now
[ -d $HOME/mathood/projects/containers/bin ] && export PATH=$PATH:$HOME/mathood/projects/containers/bin
# fix term stuff
TERM=xterm-256color
