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

## Usage

### Functions

| Command | Description |
| --- | --- |
| `confirm [prompt]` | Interactive `[y/N]` confirmation prompt used by other aliases/functions. |
| `gb` | List local branches sorted by last commit date, with tracking info. |
| `gb <args>` | Fallback to plain `git branch <args>`. |
| `gshrink [base]` | Squash all commits on the current branch since it diverged from `base` (default: `main`) into one. |
| `git-modified [base]` | List files changed on the current branch compared to `base` (default: `main`). |

### Aliases

#### Status & Remote Updates

| Alias | Command |
| --- | --- |
| `gs` | `git status` |
| `gru` | `git fetch --all --prune && git status` |

#### Pull & Push

| Alias | Command |
| --- | --- |
| `gpr` | `git pull --rebase` |
| `gprom` | `git pull --rebase origin main` |
| `gpf` | `git push --force-with-lease` |
| `gpfn` | `git push --force-with-lease --no-verify` |

#### Commit & Checkout

| Alias | Command |
| --- | --- |
| `gc` | `git commit` |
| `gcn` | `git commit --no-verify` |
| `gca` | `git commit --amend` |
| `gco` | `git checkout` |
| `gcop` | `git checkout -p` |

#### Stash

| Alias | Command |
| --- | --- |
| `gst` | `git stash` |
| `gstp` | `git stash pop` |
| `gstl` | `git stash list` |

#### Reset

| Alias | Command |
| --- | --- |
| `grh` | `git reset HEAD` |
| `grH` | `git reset --hard HEAD` |
| `grHO` | Prompts for confirmation, then hard resets to `origin/<current-branch>`. |

#### Add

| Alias | Command |
| --- | --- |
| `gap` | `git add -p` |
| `ga` | `git add` |
| `gaa` | `git add -A` |
| `gau` | `git add -u` |

#### Quick Workflows

| Alias | Command |
| --- | --- |
| `gqp` | Adds tracked changes, amends the last commit, and force-pushes (skips hooks). |
| `gwip` | Adds all changes and commits them as `"WIP"` (skips hooks). |

#### Logs

| Alias | Command |
| --- | --- |
| `gl` | Compact graph log with hash, refs, message, relative date, and author. |
| `glme` | Same as `gl`, filtered to commits authored by the current git user. |

#### Branch Cleanup

| Alias | Command |
| --- | --- |
| `gone` | ⚠️ Delete local branches whose upstream is gone (run `gru` first to refresh remote-tracking info). |

> ⚠️ **Caution:** `gone` can delete branches irreversibly.
