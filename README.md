# termux-alpine

[![Release](https://img.shields.io/github/v/release/illvart/termux-alpine?color=orange)](https://github.com/illvart/termux-alpine/releases)
[![License](https://img.shields.io/github/license/illvart/termux-alpine.svg)](https://github.com/illvart/termux-alpine/blob/master/LICENSE)
![Continuous Integration](https://github.com/illvart/termux-alpine/workflows/Continuous%20Integration/badge.svg)

> Bash script for installing **Alpine Linux** in **Termux**

<p align="center">
  <img src="https://github.com/illvart/termux-alpine/blob/master/ss.png?raw=true" alt="Alpine Linux Termux"/>
  <br>
  <em>Check out the other screenshots on my <a href="https://www.instagram.com/p/CEr87gMHUOX/?igshid=15x831l2so1m8">Instagram</a>.</em>
</p>

## Table of Contents

- [Initializing](#initializing)
  - [Installation](#installation)
    - [Launch Alpine Linux](#launch-alpine-linux)
  - [Reinstall](#reinstall)
  - [Uninstall](#uninstall)
- [Upgrade](#upgrade)
- [Options](#options)
- [Credits](#credits)
- [License](#license)

## Initializing

Open [Termux](https://termux.com/) app, copy and paste the following command in Termux.

Note: Required to install `git` and `ncurses-utils`, skip if already installed!

```bash
pkg install -y git
pkg install -y ncurses-utils
```

```bash
cd $HOME \
    && git clone -b master https://github.com/illvart/termux-alpine.git \
    && cd termux-alpine \
    && chmod +x setup-termux-alpine
```

Or download from [GitHub Releases page](https://github.com/illvart/termux-alpine/releases) and extract.

### Installation

Installation [options](#options).

```bash
./setup-termux-alpine --setup-user
```

Please follow the output of the command above!

#### Launch Alpine Linux

Just typing a command like below in Termux and enter.

```bash
termux-alpine
```

You can also running any commands inside Alpine Linux:

```bash
termux-alpine echo "Hello World"
```

### Reinstall

To reinstall just typing a command like [installation](#installation) above, type *y* for yes, and enter.

Or pass the command with [options](#options) example:

```bash
./setup-termux-alpine -S -F
```

### Uninstall

Please note! Before uninstalling, recommended to backup the current installation.

```bash
cd ${HOME}/termux-alpine \
    && ./setup-termux-alpine --uninstall
```

Or manually (isn't safe):

```bash
rm -rf ${PREFIX}/bin/termux-alpine \
    ${HOME}/.alpine
```

## Upgrade

Upgrade the installation script.

```bash
rm -rf ${HOME}/termux-alpine \
    && cd $HOME \
    && git clone -b master https://github.com/illvart/termux-alpine.git \
    && cd termux-alpine
```

### Options

```bash
Usage: ./setup-termux-alpine [options]

Options:
--install-nodejs	install nodejs-current, npm, and yarn
--install-python3	install python3 py3-pip, and py3-wheel
-S, --setup-user	setup a non-root user
-F, --fake-kernel	use a fake kernel
-u, --uninstall		full wipe the rootfs installation
-v, --version		show this program version
-h, --help		show this help information
```

If you're using `--setup-user`, to login a non-root user after installation use `login your_username` and enter the password.

## Credits

Credit to `Hax4us` and `Termux` for source.

## License

Licensed under [GPL-3.0](./LICENSE).
