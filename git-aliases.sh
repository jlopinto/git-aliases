confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
    [yY][eE][sS] | [yY])
        true
        ;;
    *)
        false
        ;;
    esac
}

# Clean git branch list
gb() {
    if [ $# -eq 0 ]; then
        git for-each-ref --sort=-committerdate refs/heads --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset)%(if)%(upstream)%(then) %(upstream:lstrip=3) %(upstream:track)%(end) - %(color:green)%(committerdate:relative)%(color:reset)'
    else
        git branch "$@"
    fi
}

# Shrink the current branch by squashing all commits into one
# Optionally specify the base branch to compare against (default: auto-detected main/master)
gshrink() {
    if [ -z "$1" ]; then
        # Auto-detect default branch: prefer main, fallback to master
        if git show-ref --verify --quiet refs/heads/main; then
            base_branch="main"
        elif git show-ref --verify --quiet refs/heads/master; then
            base_branch="master"
        else
            echo "Error: Neither 'main' nor 'master' branch found"
            return 1
        fi
    else
        base_branch="$1"
    fi
    commits_range="$(git merge-base "$base_branch" HEAD)..HEAD"
    count=$(git rev-list --count $commits_range)
    commit_msgs=$(git log --reverse --pretty=format:'- %s' $commits_range)
    full_msg="Squash $count commit(s):\n$commit_msgs"
    git reset --soft "$(git merge-base "$base_branch" HEAD)" &&
        git commit --edit -m "$full_msg" --no-verify
}

# Check that GPG signing works (e.g. before enabling commit.gpgsign)
gsign() {
    if echo "test" | gpg --clearsign >/dev/null 2>&1; then
        echo "GPG signing OK"
    else
        echo "GPG signing failed"
        return 1
    fi
}

alias gs='git status'

alias gpr='git pull --rebase'
# Auto-detect main/master for pull rebase
gprom() {
    if git show-ref --verify --quiet refs/remotes/origin/main; then
        git pull --rebase origin main
    elif git show-ref --verify --quiet refs/remotes/origin/master; then
        git pull --rebase origin master
    else
        echo "Error: Neither 'origin/main' nor 'origin/master' found"
        return 1
    fi
}

alias gpros='git pull --rebase origin staging'
alias gpf='git push --force-with-lease'
alias gpfn='git push --force-with-lease --no-verify'

alias gc="git commit"
alias gcm="git commit -eF .git/COMMIT_MSG"
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
alias glme="git log --author='$(git config --get user.name)' --graph --pretty=format:'%C(cyan)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(magenta)<%an>%Creset' --abbrev-commit --date=short"

# remove branches marked as gone
alias gone="git fetch --all --prune; git branch -vv | awk '/: gone]/{print \$1}' | xargs -r git branch -D"
