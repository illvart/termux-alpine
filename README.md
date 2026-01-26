# termux-alpine

**Bash script to install Alpine Linux in Termux**

[![CI](https://github.com/illvart/termux-alpine/workflows/CI/badge.svg)](https://github.com/illvart/termux-alpine/actions/workflows/ci.yml)
[![LICENSE](https://img.shields.io/github/license/illvart/termux-alpine)](LICENSE)

![Alpine Linux Termux](ss.jpg?raw=true)

## Table of Contents

- [Initializing](#initializing)
  - [Installation](#installation)
    - [Launch Alpine Linux](#launch-alpine-linux)
  - [Reinstall](#reinstall)
  - [Uninstall](#uninstall)
- [Upgrade](#upgrade)
- [Options](#options)
- [Supports](#supports)
- [Contributing](#contributing)
- [License](#license)

## Initializing

Open the [Termux](https://termux.com) app and copy-paste the following command:

```sh
pkg update -y && \
  pkg install -y git ncurses-utils && \
  cd $HOME && \
  git clone -b main https://github.com/illvart/termux-alpine.git && \
  cd termux-alpine && \
  chmod +x setup-termux-alpine
```

### Installation

Installation [options](#options).

```sh
./setup-termux-alpine --setup-user
```

> During installation, you will be asked to choose either the **Edge** or **Latest Stable** branch. Please follow the on-screen instructions!

#### Launch Alpine Linux

Simply run the following command in Termux:

```sh
termux-alpine
```

You can also run any command inside Alpine Linux like this:

```sh
termux-alpine echo "Hello World"
```

### Reinstall

To reinstall, simply run the [installation](#installation) command, type *y* for yes and enter.

> **Note:** Reinstalling will **not remove anything** inside `/root/` and `/home/`.  
> If you have created or modified data outside these directories, please **backup your data** before reinstalling.

You can force a fresh reinstall by passing [options](#options), for example:

```sh
./setup-termux-alpine -S -F
```

### Uninstall

Please backup your current installation before uninstallation.

Recommended method:

```sh
cd ${HOME}/termux-alpine && \
  ./setup-termux-alpine --uninstall
```

Manual (not recommended):

```sh
rm -rf ${PREFIX}/bin/termux-alpine \
  ${HOME}/.termux-alpine
```

## Upgrade

To upgrade the installation script, run the following commands:

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

If you use `--setup-user`, to login as the non-root user after installation use `login your_username` and enter the password.

## Supports

If you’re enjoying it or want to support development, feel free to donate. Thank you! ❤️

## Contributing

Want to contribute? Read the [Contributing](docs/CONTRIBUTING.md).

## License

Released under the [GPL-3.0 License](LICENSE).
