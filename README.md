# dotfiles

See ["Organising dotfiles in a git repository"](https://fuller.li/posts/organising-dotfiles-in-a-git-repository/) for more info.

## Installation

Cloning the dotfiles:

```shell
$ alias h="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.files.git"
$ h git init
$ h git remote add origin https://github.com/kylef/dotfiles.git
$ h git fetch
$ h git checkout master
```

Installing tools:

```shell
$ make
```
