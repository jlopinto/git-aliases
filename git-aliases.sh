confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
        ;;
        *)
            false
        ;;
    esac
}

alias gs='git status'
alias gb="git for-each-ref --sort=-committerdate refs/heads --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset)%(if)%(upstream)%(then) %(upstream:lstrip=3) %(upstream:track)%(end) - %(color:green)%(committerdate:relative)%(color:reset)'"

alias gpr='git pull --rebase'
alias gprom='git pull --rebase origin main'
alias gpf='git push --force-with-lease'
alias gpfn='git push --force-with-lease --no-verify'

alias gc="git commit"
alias gcn="git commit --no-verify"
alias gca="git commit --amend"
alias gco='git checkout'
alias gcop='gco -p'

alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

alias gru='git remote update'
alias grus='git remote update && git status'

alias grh='git reset HEAD'
alias grH='git reset --hard HEAD'
alias grHO='confirm "Do you really want to hard reset this branch ? [y/N]" && git reset --hard origin/$(git symbolic-ref --short HEAD)'

alias gap='git add -p'
alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'

# "git quick push", useful to amend previous commit with small changes
alias gqp='gau && gc --amend -C HEAD --no-verify && gpf --no-verify'
alias gwip='gaa && gc -m "WIP" --no-verify' 
alias gl="git log --graph --pretty=format:'%C(cyan)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(magenta)<%an>%Creset' --abbrev-commit --date=relative"
alias glme="git log --author='$(git config --get user.name)' --graph --pretty=format:'%C(cyan)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(magenta)<%an>%Creset' --abbrev-commit --date=relative"

# remove branches marked as gone
alias gone="git fetch --all --prune; git branch -vv | awk '/: gone]/{print \$1}' | xargs -r git branch -D"