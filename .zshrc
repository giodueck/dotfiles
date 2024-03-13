# Created by newuser for 5.9

## Custom
alias vim=nvim

# Memory usage by a single process
memuse() {
    smem -c pss -P "$1" -k -t | tail -n 1
}

# Human-readable and sorted list of directory and file sizes in a directory
cwdsize() {
    du -sh "$PWD"/* | sort -h
}

# Human-readable size of contents in given directory
dirsize() {
    du -sh "$1" | sort -h
}

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit -S -m"
alias gpl="git pull"
alias gps="git push"
alias gb="git branch"
alias gsh="git stash"
alias gsw="git switch"
alias gl="git log"
alias glo="git log --oneline"
alias gd="git diff"

# Zoxide
eval "$(zoxide init zsh)"
alias cd=z

# fzf
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
"
source ~/.local/share/fzf/key-bindings.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# GPG Key
GPG_TTY=$(tty)
export GPG_TTY
