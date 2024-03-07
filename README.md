# git-aliases

> A collection of useful git aliases for enhanced productivity.

## Installation

1. Clone this repository into your home directory:

    ```bash
    cd ~
    git clone git@github.com:jlopinto/git-aliases.git
    ```

2. Add the following lines to your `~/.bashrc`, `~/.profile`, or `~/.bash_profile`:

    ```bash
    if [ -f "$HOME/git-aliases/git-aliases.sh" ]; then
        . "$HOME/git-aliases/git-aliases.sh"
    fi
    ```

3. To immediately apply these aliases, you can either:
    - Run `source ~/.bashrc`
    - or simply close and restart your terminal.
