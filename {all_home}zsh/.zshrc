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
alias c="code"

alias l="exa -l"
alias ll="exa -la"

export EDITOR="nvim"
export VISUAL="nvim"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(fnm env --use-on-cd)"

# starship prompt
eval "$(starship init zsh)"

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' file-sort modification
zstyle ':completion:*' file-sort date
zstyle ':completion:*' menu yes=long select


alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

source ~/.zshplatform
