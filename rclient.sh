# shellcheck shell=bash

current_dir="$(dirname "$0")"

set -a
source $current_dir/.env
set +a


bisync() {
  local local_folder="$1"
  local remote_folder="$2"
  local args="${3:-}"
  exclude="--exclude-from $current_dir/.ignore"

  if [[ -n $args ]]; then
    echo -e "rclone bisync $local_folder $remote_folder --create-empty-src-dirs --verbose $args $exclude \n"
    rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose "$args" $exclude || exit 1
  else
    echo -e "rclone bisync $local_folder $remote_folder --create-empty-src-dirs --verbose $exclude \n"
    rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose $exclude || exit 1
  fi
}

create_config() {
  rclone config create "$REMOTE_NAME" "$STORAGE" client_id="$CLIENT_ID" client_secret="$CLIENT_SECRET"
}

if [[ $# -eq 0 ]]; then
  echo "Error: no arguments"
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case $1 in
  --help)
    echo "
bisync     - bisync 'rclone bisync local_folder remote_folder --create-empty-src-dirs --verbose exclude || exit 1'
testbisync - testbisync
resync     - first bisync
testresync - testresync
init       - initialize rclone
--help     - this massage
"
    shift
    ;;
  bisync)
    bisync "$VAULT" "$VAULTREMOTE"
    shift
    ;;
  testbisync)
    bisync "$VAULT" "$VAULTREMOTE" "--dry-run"
    shift
    ;;
  resync)
    bisync "$VAULT" "$VAULTREMOTE" "--resync"
    shift
    ;;
  testresync)
    bisync "$VAULT" "$VAULTREMOTE" "--resync --dry-run"
    shift
    ;;
  init)
    create_config
    shift
    ;;
  *)
    echo "Unknown argument: $1"
    exit 1
    ;;
  esac
done
