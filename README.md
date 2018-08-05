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

## Software

### macOS

- Desktop Environment: aqua
- Window Manager: [chunkwm](https://koekeishiya.github.io/chunkwm/)
- Hotkey Daemon: [skhd](https://github.com/koekeishiya/skhd)
- Editor: vim
- Browser: Firefox
- Shell: [fish](http://fishshell.com/)

## Usage

### Keyboard Shortcuts

General rule is `ctrl` is for control characters, `cmd` is for the desktop
environment which includes application specific shortcuts, and text field
navigation.

`hyper` and `meh` are for the window manager, `hyper` is used for window
specific actions and `meh` is for workspace or monitor level actions.

| Shortcut       | Action                |
|----------------|-----------------------|
| hyper - return | New Terminal          |

#### Focussed Window

Actions that affect the focussed window.

| Shortcut      | Action                |
|---------------|-----------------------|
| hyper - f     | Toggle fullscreen     |
| hyper - d     | Toggle Float          |
| hyper - r     | Enter resize mode     |

#### Change Focus

| Shortcut      | Action                |
|---------------|-----------------------|
| hyper - up    | Focus up window       |
| hyper - right | Focus right window    |
| hyper - down  | Focus down window     |
| hyper - left  | Focus left window     |
| hyper - 1     | Focus Desktop 1       |
| hyper - 2     | Focus Desktop 2       |
| hyper - 3     | Focus Desktop 3       |
| hyper - 4     | Focus Desktop 4       |
| hyper - 5     | Focus Desktop 5       |
| hyper - 6     | Focus Monitor 1       |
| hyper - 7     | Focus Monitor 2       |
| hyper - 8     | Focus Monitor 3       |

##### Resize Mode

| Shortcut      | Action    |
|---------------|-----------|
| up            |           |
| right         |           |
| down          |           |
| left          |           |
| shift - up    |           |
| shift - right |           |
| shift - down  |           |
| shift - left  |           |
| esc           | Exit Mode |
| return        | Exit Mode |

#### Current Desktop

| Shortcut      | Action                |
|---------------|-----------------------|
| meh - r       | Rotate 90             |
| meh - x       | Flip X-axis           |
| meh - y       | Flip Y-axis           |
| meh - e       | Equalise Window Sizes |
| meh - g       | Toggle Gaps           |
| meh - b       | BSP Mode              |
| meh - m       | Monocle Mode          |
| meh - d       | Floating Mode         |
| meh - s       | Toggle split          |
| meh - f       | Toggle native fullscreen |
| meh - o       | Enter Gaps Mode       |

#### Move Focussed Window

| Shortcut      | Action                |
|---------------|-----------------------|
| meh - up      | Swap up window        |
| meh - right   | Swap right window     |
| meh - down    | Swap down window      |
| meh - left    | Swap left window      |
| meh - 1       | Move to Desktop 1     |
| meh - 2       | Move to Desktop 2     |
| meh - 3       | Move to Desktop 3     |
| meh - 4       | Move to Desktop 4     |
| meh - 5       | Move to Desktop 5     |
| meh - 6       | Move to Monitor 1     |
| meh - 7       | Move to Monitor 2     |
| meh - 8       | Move to Monitor 3     |

#### Gaps Mode

| Shortcut      | Action           |
|---------------|------------------|
| down          | Decrease Gaps    |
| up            | Increase Gaps    |
| left          | Decrease Padding |
| right         | Increase Padding |
| esc           | Exit Mode        |
| return        | Exit Mode        |
