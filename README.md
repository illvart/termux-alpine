# termux-alpine

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
pkg install -y git ncurses-utils
```

```bash
cd $HOME \
    && git clone https://github.com/illvart/termux-alpine.git \
    && cd termux-alpine
```

### Installation

Installation [options](#options).

```bash
bash setup-termux-alpine.sh --setup-user
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
bash setup-termux-alpine.sh -S -F
```

### Uninstall

Please note! Before uninstalling, recommended to backup the current installation.

```bash
cd ${HOME}/termux-alpine \
    && bash setup-termux-alpine.sh --uninstall
```

Or manually (isn't safe):

```bash
rm -rf ${PREFIX}/bin/termux-alpine \
    ${HOME}/alpine
```

## Upgrade

Upgrade the installation script.

```bash
rm -rf ${HOME}/termux-alpine \
    && cd $HOME \
    && git clone https://github.com/illvart/termux-alpine.git \
    && cd termux-alpine
```

### Options

```bash
Usage: bash setup-termux-alpine.sh [options]

Options:
--install-nodejs	install nodejs-current, npm, and yarn
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

Licensed under [MIT](./LICENSE).
