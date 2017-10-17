# dotfiles

See ["Organising dotfiles in a git repository"](https://fuller.li/posts/organising-dotfiles-in-a-git-repository/) for more info.

## Installation

Cloning the dotfiles:

```shell
$ alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
$ home init
$ home remote add origin https://github.com/kylef/dotfiles.git
$ home fetch
$ home checkout master
```

Installing tools:

```shell
$ make
```

