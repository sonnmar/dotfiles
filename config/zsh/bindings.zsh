#
# Keybindings
#

# keys in vi insert mode
bindkey -M viins "\e[A" up-line-or-search         # arrow up
bindkey -M viins "\e[B" down-line-or-search       # arrow down
bindkey -M viins "\e[H" beginning-of-line         # pos1
bindkey -M viins "\e[F" end-of-line               # end
bindkey -M viins "\e[1;2C" forward-word           # shift arrow right
bindkey -M viins "\e[1;2D" backward-word          # shift arrow left
bindkey -M viins "\e[3~" delete-char              # delete
bindkey -M viins "\e[?" backward-delete-char      # backspace
bindkey -M viins "\e[1~" beginning-of-line        # pos1 in tmux
bindkey -M viins "\e[4~" end-of-line              # end in tmux

# vimkeys in vi normal mode
bindkey -M vicmd "j" down-line-or-search
bindkey -M vicmd "k" up-line-or-search
bindkey -M vicmd "\e[H" beginning-of-line         # pos1
bindkey -M vicmd "\e[F" end-of-line               # end
bindkey -M vicmd "\e[1;2C" forward-word           # shift arrow right
bindkey -M vicmd "\e[1;2D" backward-word          # shift arrow left
bindkey -M vicmd "\e[3~" delete-char              # delete
bindkey -M vicmd "\e[?" backward-delete-char      # backspace
bindkey -M vicmd "\e[1~" beginning-of-line        # pos1 in tmux
bindkey -M vicmd "\e[4~" end-of-line              # end in tmux

# keys in emacs mode
bindkey -M emacs "\e[A" up-line-or-search         # arrow up
bindkey -M emacs "\e[B" down-line-or-search       # arrow down
bindkey -M emacs "\e[H" beginning-of-line         # pos1
bindkey -M emacs "\e[F" end-of-line               # end
bindkey -M emacs "\e[1;2C" forward-word           # shift arrow right
bindkey -M emacs "\e[1;2D" backward-word          # shift arrow left
bindkey -M emacs "\e[3~" delete-char              # delete
bindkey -M emacs "\e[?" backward-delete-char      # backspace
bindkey -M emacs "\e[1~" beginning-of-line        # pos1 in tmux
bindkey -M emacs "\e[4~" end-of-line              # end in tmux

