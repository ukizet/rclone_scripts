# shellcheck shell=bash

current_dir="$(dirname "$0")"

BASEBRAINY="$HOME/Documents/vaults/BaseBrainy/" # /home/sas/Documents/vaults/BaseBrainy
BASEBRAINYREMOTE="remote:Vaults/BaseBrainy/"

BASHSCRIPTS="$HOME/Documents/repos/bash_scripts/"
BASHSCRIPTSREMOTE="remote:bash_scripts/"

VAULT="$HOME/Documents/Vaults/Vault/"
VAULTREMOTE="remote:Vaults/Vault/"

CLIENT_ID="1063561364943-56g8n49kegfi0u4it96h7fpssbu2jlf8.apps.googleusercontent.com"
CLIENT_SECRET="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"

bisync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose "$exclude" || exit 1
}

test_bisync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose --dry-run "$exclude" || exit 1
}

resync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose --resync "$exclude" || exit 1
}

test_resync() {
  local_folder="$1"
  remote_folder="$2"
  exclude="--exclude-from $current_dir/.ignore"
  rclone bisync "$local_folder" "$remote_folder" --create-empty-src-dirs --verbose --resync "$exclude" || exit 1
}

if [[ $# -eq 0 ]]; then
  echo "Error: no arguments"
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case $1 in
    bisync)
      bisync "$VAULT" "$VAULTREMOTE"
      shift
      ;;
    testbisync)
      echo "not ready"
      shift
      ;;
    resync)
      echo "not ready"
      shift
      ;;
    testresync)
      echo "not ready"
      shift
      ;;
    init)
      echo "not ready"
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done
