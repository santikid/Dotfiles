# git aliases
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

alias vim="nvim"

alias l="ls -l"
alias ll="ls -la"

export EDITOR="nvim"
export VISUAL="nvim"

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' file-sort modification
zstyle ':completion:*' file-sort date
zstyle ':completion:*' menu yes=long select

bindkey -v
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '^R' history-incremental-search-backward

source <(fzf --zsh)

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

export PATH="$PATH:$HOME/.config/bin"
source ~/.zshplatform

# bun completions
[ -s "/Users/santi/.bun/_bun" ] && source "/Users/santi/.bun/_bun"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/santi/.lmstudio/bin"
