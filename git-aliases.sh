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
alias gb='git branch -vv --sort=-committerdate'

alias gpr='git pull --rebase'
alias gprom='git pull --rebase origin master'
alias gpf='git push --force-with-lease'

alias gc="git commit -s"
alias gca="git commit -s --amend"
alias gco='git checkout'
alias gcop='gco -p'

alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

alias gru='git remote update'

alias grh='git reset HEAD'
alias grH='git reset --hard HEAD'
alias grHO='confirm && git reset --hard origin/$(git symbolic-ref --short HEAD)'

alias gap='git add -p'
alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'
# "git quick push", useful to amend previous commit with small changes
alias gqp='gau && gc --amend -C HEAD && gpf'

alias gl="git log --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"
alias glme="git log --author='$(git config --get user.name)' --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"
alias glog='git log --graph --oneline --all --decorate'

# remove branches marked as gone
alias gone="git fetch --all --prune; git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D;"