# Einstellungen
autoload -U colors && colors
setopt transientrprompt
setopt prompt_subst


# detect editor mode
ED_MODE="$(set -o | grep 'vi.*on' 2> /dev/null)"
if [[ -n "$ED_MODE" ]]; then
    PROMPT="%{$fg[blue]%}\$(prs_mode)>%{$reset_color%}"
else
    PROMPT="%{$fg[blue]%}>%{$reset_color%}"
fi

PROMPT+="%{$fg[green]%}\$(prs_adr)>%{$reset_color%}"
PROMPT+="%{$fg[cyan]%}%~>%{$reset_color%} "

RPROMPT="%{$fg[yellow]%}\$(prs_git)%{$reset_color%}"
RPROMPT+="%{$fg[magenta]%}\$(prs_bgc)%{$reset_color%}"
RPROMPT+="%{$fg[red]%}%(?..[%?])%{$reset_color%}"

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[yellow]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[yellow]%}]%{$reset_color%}"
GIT_PROMPT_SEPARATOR="%{$fg[yellow]%}|%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"


function prs_git() {
    # If inside a Git repository, print its branch and state
    # local git_where=`(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)  2> /dev/null`
    local git_where=$((git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)  2> /dev/null)
    if [[ -n "$git_where" ]]; then
        echo "$GIT_PROMPT_PREFIX$GIT_PROMPT_SYMBOL$(prs_git_state)%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
    fi
}

# Some git-data
function prs_git_state() {
    # Show different symbols as appropriate for various Git repository states
    # Compose this value via multiple conditional appends.
    local GIT_STATE=""
    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [[ "$NUM_AHEAD" -gt 0 ]]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
    fi
    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [[ "$NUM_BEHIND" -gt 0 ]]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
    fi
    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [[ -n $GIT_DIR ]] && test -r $GIT_DIR/MERGE_HEAD; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
    fi
    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi
    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi
    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi
    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_STATE$GIT_PROMPT_SEPARATOR"
    fi
}

# Count background jobs
function prs_bgc() {
    local jc=`jobs -p 2> /dev/null | wc -l | tr -d ' '`
    if [[ $jc -gt 0 ]]; then
        echo "[$jc]"
    fi
}

# Username if not equal Logname
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

# Editingmode
function prs_mode () {
    echo "${${KEYMAP/vicmd/<N}/(main|viins)/<I}"
}

# register Functions
zle -N zle-line-init
zle -N zle-keymap-select

# call on line-init and keamyp-select
function zle-line-init zle-keymap-select () {
    # reset the prompt
    zle reset-prompt
}
