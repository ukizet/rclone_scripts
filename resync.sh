# shellcheck shell=bash

current_dir="$(dirname "$0")"

source "$current_dir/config.sh" || exit 1

resync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose --resync "$exclude" || exit 1
}

sync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone sync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose --interactive "$exclude" || exit 1
}

# resync "$BASHSCRIPTS" "$BASHSCRIPTSREMOTE"
# resync "$BASEBRAINY" "$BASEBRAINYREMOTE" 
# resync "$VAULT" "$VAULTREMOTE"

# sync "$VAULT" "$VAULTREMOTE"