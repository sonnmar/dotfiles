#
# Aliases
#

# chmod
alias mex='chmod 755'
alias nex='chmod 644'

# list dir
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -a'
alias llaa='lla -@'

# change dir
alias ..='cd ..'

# applications
alias more='less'
alias vi='nvim'
alias vim='nvim'
alias cat='bat'
alias ste='nvim $(fzf -m --preview "bat --color=always --style=numbers {}")'

# git
alias gis='git status'
alias gia='git add'
alias gir='git restore'

