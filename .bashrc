# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias be="bundle exec"
alias ru="bundle exec rackup"

# display git branch
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ {\1}/'
}
function proml {
    PS1="[\u@\h \W]\$(parse_git_branch) \$ "
}
proml
