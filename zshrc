#
# zsh Konfigurationsdatei
#

# Allgemein
setopt correct                  # Autocorrectur
setopt autocd                   # nicht gefundene Commands als Directory auffassen und ls testen
setopt no_beep                  # kein Krach


# Jobcontrol
setopt longlistjobs             # PID auch von suspendierten Prozessen anzeigen
setopt notify                   # Status von Backroundprozessen anzeigem
#setopt nohup                   # Jobs beim stoppen der Shell von dieser disownen


# Globbing and findig
#setopt no_nomatch              # "zsh: no match found..." verhindern, gibt nur den Begriff aus
#setopt null_glob               # gibt bei "no match found" eine leere Zeile aus
setopt extendedglob             # erweitertes Globbing
setopt nocaseglob               # Case indenditiv globbing
setopt noglobdots               # keine Dotfiles matchen
setopt rcexpandparam            # Arrayerweiterung mit Parametern
setopt numericglobsort          # Dateinamen nummerisch sortieren


# Vervollständigung
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -u -d ~/.zsh/zcompdump-$ZSH_VERSION
setopt hash_list_all
setopt completeinword

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'                      # Speed up completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh


# Push / Pop
setopt auto_pushd               # alte Directoryeinträge stacken
setopt pushd_ignore_dups        # doppelte Einträge vermeiden


# History
HISTFILE="$HOME/.zsh/history"
SAVEHIST=500
HISTSIZE=1000
setopt sharehistory             # History zwischen den zsh-Instanzen tauschen
setopt appendhistory            # Historyeinträge anhängen
setopt extendedhistory          # chronologische Ablage der History be mehrere Instanzen
setopt histignorealldups        # Dupletten in der History vermeiden
setopt histreduceblanks         # blanks in Einträge komprimieren
setopt histnostore              # Befehle zur History nicht ablegen
setopt histignorespace          # Befehle mit Blank am Anfang nicht speichern


# ZLE-Modus and Keys
setopt emacs
bindkey -- "\e[7~" beginning-of-line        # Anfang
bindkey -- "\e[8~" end-of-line              # Ende
bindkey -- "\e[3~" delete-char              # Entfernen (vorwärts)
bindkey -- "\e[1;2D" backward-word          # Shift-left
bindkey -- "\e[1;2C" forward-word           # Shift-right
bindkey -- "\e[A" up-line-or-search         # Pfeil aufwärts
bindkey -- "\e[B" down-line-or-search       # Pfeil abwärts


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
alias lla='la -l'
alias llaa='la -lh@'
alias ..='cd ..'
alias more='less'
# alias vi='nvim'
# alias vim='nvim'


# Anwendungen
export PAGER=less
export EDITOR=nano
# export EDITOR=vi


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


# Syntaxhighlighting im Prompt
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters


# Autosuggestion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


# schönes Prompt
source ~/.dotfiles/simpleprompt.sh
# typeset -a AP_CONFIG_SECS
# AP_CONFIG_SECS+=('prs_mode 253 237 253 237')    # VI-Mode
# AP_CONFIG_SECS+=('prs_git 253 239')             # Git
# AP_CONFIG_SECS+=('prs_path 253 241')            # Path
# AP_CONFIG_SECS+=('prs_prompt 007 000')          # Prompt
# AP_CONFIG_SECS+=('prs_host 253 241')            # Hostname
# AP_CONFIG_SECS+=('prs_user 253 239')            # Username
# AP_CONFIG_SECS+=('prs_stat 253 237')            # Statistics
# AP_CONFIG_SECS+=('prs_error 238 215')           # Error
# source ~/.dotfiles/airprompt/airprompt.sh
