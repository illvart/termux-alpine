#!/data/data/com.termux/files/usr/bin/bash
##
## Copyright (C) 2020-present illvart
## https://github.com/illvart/termux-alpine
##
## Licensed under GPL-3.0 https://github.com/illvart/termux-alpine/blob/main/LICENSE
##
set -Eeuo pipefail

## Colors
if [ -n "`command -v tput`" ] && [ `tput colors` -ge 8 ]; then
    RST="`tput sgr0`"
    RED="`tput setaf 1`"
    GREEN="`tput setaf 2`"
    YELLOW="`tput setaf 3`"
    BLUE="`tput setaf 4`"
    CYAN="`tput setaf 6`"
    BOLD="`tput bold`"
    ITALIC="`tput sitm`"
else
    RST="\x1b[0m"
    RED="\x1b[31m"
    GREEN="\x1b[32m"
    YELLOW="\x1b[33m"
    BLUE="\x1b[34m"
    CYAN="\x1b[36m"
    BOLD="\x1b[1m"
    ITALIC="\x1b[3m"
fi

## Cursor
NOBLINK="\e[?25l"
BLINK="\e[?25h"

## Emojis
PENGUIN=$'\360\237\220\247'
COFFEE=$'\342\230\225'
ROCKET=$'\360\237\232\200'
YAY=$'\360\237\216\211'

## Error signal
function TRAP_ERR() {
    local err="$1" line="$2" linecall="$3" command="$4" fnstack="$5"
    echo
    echo -e "$0:${BLINK}"
    echo -e " ${BOLD}${YELLOW}Error${RST} in ${RED}${command}${RST}"
    echo -e " at line ${line} - exited with status ${CYAN}${err}${RST}"
    if [ "$fnstack" != "::" ]; then
        echo -en "called ${YELLOW}${ITALIC}${fnstack}${RST}"
        [ "$linecall" != "" ] && echo -e " at line ${linecall}" || echo
    fi
    echo
    exit 201
}
## Exit signal
function TRAP_EXIT() { echo -en "${BLINK}${RST}"; set +Eeuo pipefail; exit 0; }
## Signal code
function TRAP_SIGNAL() { echo -e "$0:"; echo -e " at line $2 exited with signal status ${CYAN}$1${RST}"; exit 211; }

## Logger
function task() { echo -e "${BLUE}[+]${RST} $*"; }
function danger() { echo -e "${RED}[!]${RST} $*"; }
function die() { echo -e "${YELLOW}$*${RST}"; exit 1; }

## Divider
function divider() { printf -v cols "%${COLUMNS:-`tput cols 2>&-||echo 80`}s\n" && echo ${cols// /-}; }

## Spinner
function spinner() {
    local dots=("⠏" "⠛" "⠹" "⠼" "⠶" "⠧") pid=$! i=0
    printf "$NOBLINK"
    while kill -0 $pid 2>/dev/null; do
        local s=" ${dots[$(( $i % ${#dots[@]} ))]} $*"
        printf "${CYAN}%s${RST}" "$s"
        i=$(($i+1))
        sleep 0.1
        for (( c=0; $c < ${#s}; c++ )); do
            printf "\b"
        done
    done
    printf "$BLINK"
}

## Asking for user
function ask() {
    local yn
    while true; do
        echo -en "$* ${CYAN}[y/n]${RST} "
        read yn </dev/tty
        case "$yn" in
            [yY][eE][sS]|[yY]) return 0 ;;
            [nN][oO]|[nN]) return 1 ;;
            * ) echo; echo -e "${YELLOW}Please answer yes or no.${RST}" ;;
        esac
    done
}

## If directory exits and is not empty
function is_dir_not_empty() { [[ -d "$*" && "`ls -A $*`" ]] && return 0 || return 1; }

## curl with some safety flags
function curl_safety() { curl --progress-bar --location --fail --retry 5 --retry-connrefused --retry-delay 5 --remote-name "$*"; }

## Return getprop empty or not
function is_getprop() { local prop=`command -v getprop`||:; [[ "$prop" && ! -z "$prop" ]] && return 0 || return 1; }

## Get timezone from android
function timezone() { local TZ="" tz=`getprop persist.sys.timezone`; is_getprop && [[ "$tz" && ! -z "$tz" ]] && TZ="$tz"; echo "$TZ"; }
timezone=`timezone`
