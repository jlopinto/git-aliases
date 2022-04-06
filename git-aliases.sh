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

alias gl='git log --graph --decorate --all'
alias glog='git log --graph --oneline --all --decorate'
alias glogo='glog `git reflog | cut -c1-7`'
alias glago="git log --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"