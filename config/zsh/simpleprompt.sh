# Einstellungen
autoload -U colors && colors
setopt transientrprompt
setopt prompt_subst


# detect editor mode
PROMPT="%{$fg[blue]%}"
if [[ -n "$(set -o | grep 'vi.*on' 2> /dev/null)" ]]; then
    PROMPT+="\${\${KEYMAP/vicmd/<N}/(main|viins)/<I}"
fi
PROMPT+=">%{$reset_color%}"

PROMPT+="%{$fg[green]%}\$(prs_adr)>%{$reset_color%}"
PROMPT+="%{$fg[cyan]%}%~>%{$reset_color%} "

RPROMPT="\$(prs_git)"
RPROMPT+="%{$fg[magenta]%}\$(prs_bgc)%{$reset_color%}"
RPROMPT+="%{$fg[red]%}%(?..[%?])%{$reset_color%}"

prs_git () {
    # TODO: Integrate merge conflicts (local git path with directory "MERGE_HEAD"?)
    # return value
    local str="%{$fg[yellow]%}[%{$reset_color%}"

    # branch name
    local bra="$(git symbolic-ref --short --quiet HEAD 2> /dev/null)"

    # if there is a branche name it should be a git repository
    if [[ -n "$bra" ]]; then

        # is there a remote host?
        if [[ -n $(git config --get remote.origin.url) ]]; then

            # local commits ahead and behind
            local ahead="${$(git log --oneline @{u}.. 2> /dev/null | wc -l)/' '#/}"
            local behind="${$(git log --oneline ..@{u} 2> /dev/null | wc -l)/' '#/}"

            str+="%{$fg[blue]%}"

            if [[ $ahead -gt 0 ]]; then
                str+="A$ahead"
            elif [[ $behind -gt 0 ]]; then
                str+="B$behind"
            else
                str+="-"
            fi

            str+="%{$reset_color%}"
        fi

        str+="%{$fg[yellow]%}|%{$reset_color%}"

        # number of staged modified files
        str+="%{$fg[green]%}${$(git diff --cached --numstat 2> /dev/null | wc -l)/' '#/}%{$reset_color%}"

        # number of unstaged modified files
        str+="%{$fg[yellow]%}${$(git ls-files --modified --exclude-standard 2> /dev/null | wc -l)/' '#/}%{$reset_color%}"

        # Number of untracked files
        str+="%{$fg[red]%}${$(git ls-files --other --exclude-standard 2> /dev/null | wc -l)/' '#/}%{$reset_color%}"

        str+="%{$fg[yellow]%}|$bra]%{$reset_color%}"
        echo "$str"
    fi
}

# Count background jobs
function prs_bgc() {
    local jc=`jobs -p 2> /dev/null | wc -l | tr -d ' '`
    if [[ $jc -gt 0 ]]; then
        echo "[$jc]"
    fi
}

# User- and Hostname if not equal to logon names
function prs_adr() {
    local str=""
    if [[ "$USER" != "$LOGNAME" || -n "$SSH_CONNECTION" ]]; then
        str="$USER"
    fi
    if [[ -n "$SSH_CONNECTION" ]]; then
        str+="@$(hostname | cut -d'.' -f1)"
    fi
    echo "$str"
}

# register Functions
zle -N zle-line-init
zle -N zle-keymap-select

# call on line-init and keymap-select
function zle-line-init zle-keymap-select () {
    # reset the prompt
    zle reset-prompt
}
