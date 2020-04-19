# Einstellungen nach System
case "$(uname)" in
    "Darwin")
        export PATH=.:$HOME/bin:$HOME/Library/Python/3.7/bin:$PATH
        alias ls='ls -G'
        ;;
    "Linux")
        export PATH=.:$HOME/bin:$PATH
        alias ls='ls --color'
        ;;
    *)
        ;;
esac


# einige sinnvolle aliase
alias mex='chmod 755'
alias nex='chmod 644'
alias ll='ls -lh'
alias la='ls -A'
alias lla='la -lh'
alias llaa='la -lh@'
alias ..='cd ..'
alias more='less'
alias vim='nvim'
alias vi='nvim'
# alias tmux='tmux -f ~/.config/tmux/tmux.conf'


# Anwendungen
export PAGER=less
export EDITOR=nvim



