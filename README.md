# `termux-alpine`

[![Release](https://img.shields.io/github/v/release/illvart/termux-alpine?color=orange)][1]
[![License: GPL-3.0](https://img.shields.io/badge/License-GPLv3-blue.svg)][2]
[![CI Status](https://github.com/illvart/termux-alpine/workflows/CI/badge.svg)](https://github.com/illvart/termux-alpine/actions)

> Bash script for installing **Alpine Linux** in [Termux].

<p align="center">
  <img src="https://github.com/illvart/termux-alpine/blob/main/ss.png?raw=true" alt="Alpine Linux Termux"/>
  <br>
  <em>Check out the other screenshots on my <a href="https://www.instagram.com/p/CEr87gMHUOX/?igshid=15x831l2so1m8">Instagram</a>.</em>
</p>

## Table of Contents

<details>
<summary>Details</summary>

- [Initializing](#initializing)
  - [Installation](#installation)
    - [Launch Alpine Linux](#launch-alpine-linux)
  - [Reinstall](#reinstall)
  - [Uninstall](#uninstall)
- [Upgrade](#upgrade)
- [Options](#options)
- [Supports](#sparkling_heart-supports)
- [Credits](#credits)
- [License](#license)

</details>

## Initializing

Open [Termux] app, copy and paste the following command in Termux.

Note: Required to install `git` and `ncurses-utils`, skip if already installed!

```sh
pkg install -y git
pkg install -y ncurses-utils
```

```sh
cd $HOME && \
    git clone -b main https://github.com/illvart/termux-alpine.git && \
    cd termux-alpine && \
    chmod +x setup-termux-alpine
```

Or download from [GitHub Releases page][1] and extract.

### Installation

Installation [options](#options).

```sh
./setup-termux-alpine --setup-user
```

Please follow the output of the command above!

#### Launch Alpine Linux

Just typing a command like below in Termux and enter.

```sh
termux-alpine
```

You can also running any commands inside Alpine Linux:

```sh
termux-alpine echo "Hello World"
```

### Reinstall

To reinstall just typing a command like [installation](#installation) above, type *y* for yes, and enter.

Or pass the command with [options](#options) example:

```sh
./setup-termux-alpine -S -F
```

### Uninstall

Please note! Before uninstalling, recommended to backup the current installation.

```sh
cd ${HOME}/termux-alpine && \
    ./setup-termux-alpine --uninstall
```

Or manually (isn't safe):

```sh
rm -rf ${PREFIX}/bin/termux-alpine \
    ${HOME}/.alpine
```

## Upgrade

Upgrade the installation script.

```sh
rm -rf ${HOME}/termux-alpine && \
    cd $HOME && \
    git clone -b main https://github.com/illvart/termux-alpine.git && \
    cd termux-alpine
```

## Options

```sh
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

## :sparkling_heart: Supports

This project is open source and free to use under the [license](#license). However, if you are using this project and happy with it or just want to encourage me to continue creating stuff, there are few ways to supporting:

- [PayPal]
- [Patreon]
- [BuyMeACoffee]
- [Saweria]

## Credits

Credit to [Hax4us](https://github.com/Hax4us) and [termux](https://github.com/termux) for source.

## License

This project is licensed under the **GPL-3.0 License**. See the [LICENSE][1] file for details.


[1]: https://github.com/illvart/termux-alpine/releases
[2]: https://github.com/illvart/termux-alpine/blob/main/LICENSE
[Termux]: https://termux.com
[Patreon]: https://patreon.com/illvart
[PayPal]: https://www.paypal.me/illvart
[BuyMeACoffee]: https://www.buymeacoffee.com/illvart
[Saweria]: https://saweria.co/illvart

