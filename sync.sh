# shellcheck shell=bash

current_dir="$(dirname "$0")"

source "$current_dir/config.sh" || exit 1

bisync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose $exclude || exit 1
}

bisync "$VAULT" "$VAULTREMOTE"
