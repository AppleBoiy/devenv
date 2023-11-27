# Setup auto rum command

> **NOTE**
> `THIS COMMAND IS REALLY DANGEROUS, IT WILL DELETE ALL YOUR FILES IN THE CURRENT DIRECTORY`
> make sure you know what you are doing before using this command if you don't want to lose your files
> I'm not responsible for any data loss or damage to your computer.

## Install

Create script named `run` in `/usr/local/bin/`


```bash
#!/usr/bin/env bash

#- WARNING: THIS COMMAND IS TOO DANGEROUS TO BE USED BY ANYONE BUT THE AUTHOR.

set -e

DIR_SCRIPTS="$HOME/.devenv/scripts/compet"
CLEAR="$DIR_SCRIPTS/clear"
TEST="$DIR_SCRIPTS/test"
EXECUTE="$DIR_SCRIPTS/execute"
UPDATE="$DIR_SCRIPTS/update"

is_valid_directory() {
local current_dir
current_dir="$(pwd)"
if [[ "$current_dir" == "$HOME/repo" || $current_dir =~ cmu-y ]]; then
    return 0  # Valid directory
  else
    return 1  # Invalid directory
  fi
}


if ! is_valid_directory; then
  echo "Please run this script from the  git repo directory"
  echo "or a directory containing 'cmu-y' in its absolute path."
  exit 1
fi

case "$1" in
	"clear" | "c")
		bash "$CLEAR"
		;;

	"test" | "t")
		bash "$TEST"
		;;

	"execute" | "e")
		bash "$EXECUTE" "$2"
		;;

	"update" | "u")
		bash "$UPDATE" "$2" "$3"
		;;

	*)
		echo "Usage: run [command] [args]"
		echo "clear: clear generated files"
		echo "test: run tests"
		echo "execute: run program"
		echo "update: update program"
		;;
esac

```

add permission

```bash
sudo chmod +x /usr/local/bin/run
```

## Usage

```bash
run <command>
```