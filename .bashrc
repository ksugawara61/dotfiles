# display git branch
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ {\1}/'
}
function proml {
    PS1="[\u@\h \W]\$(parse_git_branch) \$ "
}
proml
