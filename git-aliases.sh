get_git_username() {
    echo 'git config --get user.name'
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

alias gap='git add -p'
alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'
alias gqp='gau && gc --amend -C HEAD && gpf'

alias gl="git log --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"
alias glme="git log --author='$(get_git_username)' --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"
alias glog='git log --graph --oneline --all --decorate'

alias gone="!f() { git fetch --all --prune; git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D; }; f"