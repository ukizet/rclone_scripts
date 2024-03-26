BASEBRAINY=""
BASHSCRIPTS=""

CLIENT_ID="CLIENT_ID"
CLIENT_SECRET="CLIENT_SECRET"

source ./config.sh

if [[ -f "./config.sh" ]]; then
  echo "Found config.sh, everything is OK.."
else
  echo "config.sh was not found. Local variables will be used (they can be outdated)."
  BASEBRAINY="$HOME/Documents/BaseBrainy/"
  BASHSCRIPTS="$HOME/Documents/repos/bash_scripts/"
fi

REMOTE_NAME=remote
STORAGE=drive

mkdir -p -v "$BASEBRAINY"

mkdir -p -v "$BASHSCRIPTS"

mkdir -p -v "$LOGSEQ"

rclone config create $REMOTE_NAME $STORAGE client_id=$CLIENT_ID client_secret=$CLIENT_SECRET
