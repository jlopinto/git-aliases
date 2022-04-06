# git-aliases

> A set of git aliases

## Install

1. Clone this repo in your home directory

    `cd ~` then `git clone git@github.com:jlopinto/git-aliases.git` 

2. Add this lines to `~/.bashrc` (or `~/.profile` or `~/.bash_profile`)

    ```bash
    if [ -f "$HOME/git-aliases/git-aliases.sh" ]; then
        . "$HOME/git-aliases/git-aliases.sh"
    fi
    ``` 

3. In order to make those alias to take effects immediately you can:
    - `source ~/.bashrc` 
    - or simply close and restart your terminal.
