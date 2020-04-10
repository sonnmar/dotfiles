#
# zsh Konfigurationsdatei
#


# Jobcontrol
setopt longlistjobs             # PID auch von suspendierten Prozessen anzeigen
setopt notify                   # Status von Backroundprozessen anzeigem
#setopt nohup                   # Jobs beim stoppen der Shell von dieser disownen


# Globbing and findig
#setopt no_nomatch              # "zsh: no match found..." verhindern, gibt nur den Begriff aus
#setopt null_glob               # gibt bei "no match found" eine leere Zeile aus
setopt extended_glob            # erweitertes Globbing
setopt no_glob_dots             # keine Dotfiles matchen
setopt auto_cd                  # nicht gefundene Commands als Directory auffassen und ls testen


# Push / Pop
setopt auto_pushd               # alte Directoryeinträge stacken
setopt pushd_ignore_dups        # doppelte Einträge vermeiden


# History
HISTFILE="$HOME/.zsh_history"
SAVEHIST=10000
HISTSIZE=12000
setopt share_history            # History zwischen den zsh-Instanzen tauschen
setopt append_history           # Historyeinträge anhängen
setopt extended_history         # chronologische Ablage der History be mehrere Instanzen
setopt hist_ignore_all_dups     # Dupletten in der History vermeiden
setopt hist_reduce_blanks       # blanks in Einträge komprimieren
setopt hist_no_store            # Befehle zur History nicht ablegen
setopt hist_ignore_space        # Befehle mit Blank am Anfang nicht speichern


# Vervollständigung
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit -u
#setopt hash_list_all
#setopt completeinword


# Allgemein
setopt no_beep


# VI-Mode
setopt vi
export KEYTIMEOUT=1
bindkey -v
bindkey -M vicmd "\e[7~" beginning-of-line       # Anfang
bindkey -M vicmd "\e[8~" end-of-line             # Ende
bindkey -M vicmd "\e[3~" delete-char             # Entfernen (vorwärts)
bindkey -M vicmd "\e[1;2D" backward-word         # shift-left
bindkey -M vicmd "\e[1;2C" forward-word          # shift-right
bindkey -M vicmd "\e[A" up-line-or-search        # Pfeil aufwärts
bindkey -M vicmd "\e[B" down-line-or-search      # Pfeil abwärts
bindkey -M viins "\e[7~" beginning-of-line       # Anfang
bindkey -M viins "\e[8~" end-of-line             # Ende
bindkey -M viins "\e[3~" delete-char             # Entfernen (vorwärts)
bindkey -M viins "\e[1;2D" backward-word         # shift-left
bindkey -M viins "\e[1;2C" forward-word          # shift-right
bindkey -M viins "\e[A" up-line-or-search        # Pfeil aufwärts
bindkey -M viins "\e[B" down-line-or-search      # Pfeil abwärts


# EMACS-Mode
# bindkey -e
# bindkey -e "\e[7~" beginning-of-line       # Anfang
# bindkey -e "\e[8~" end-of-line             # Ende
# bindkey -e "\e[3~" delete-char             # Entfernen (vorwärts)
# bindkey -e "\e[1;2D" backward-word         # shift-left
# bindkey -e "\e[1;2C" forward-word          # shift-right
# bindkey -e "\e[A" up-line-or-search        # Pfeil aufwärts
# bindkey -e "\e[B" down-line-or-search      # Pfeil abwärts


# Spezialitäten wie z.B. Pfade einbinden
source ~/.dotfiles/settings.sh


# schönes Prompt
# source ~/.dotfiles/prompt.sh
typeset -a AP_CONFIG_SECS
AP_CONFIG_SECS+=('prs_mode 253 237 253 237')    # VI-Mode
AP_CONFIG_SECS+=('prs_git 253 239')             # Git
AP_CONFIG_SECS+=('prs_path 253 241')            # Path
AP_CONFIG_SECS+=('prs_prompt 007 000')          # Prompt
AP_CONFIG_SECS+=('prs_host 253 241')            # Hostname
AP_CONFIG_SECS+=('prs_user 253 239')            # Username
AP_CONFIG_SECS+=('prs_stat 253 237')            # Statistics
AP_CONFIG_SECS+=('prs_error 238 215')           # Error
source ~/.dotfiles/airprompt/airprompt.sh
