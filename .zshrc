# Created by newuser for 5.9

export LC_ALL="C"

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
# # Tokyonight colorscheme
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
# --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
source ~/.local/share/fzf/key-bindings.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# GPG Key
GPG_TTY=$(tty)
export GPG_TTY
