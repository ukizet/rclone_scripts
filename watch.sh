echo -en "\\033]0;Watch_BaseBrainy\\a" # sets terminal name

DIR="/home/sas/Documents/BaseBrainy/" # The directory to watch

SCRIPT="/home/sas/Documents/gdrive_scr/sync.sh" # The script to run when changes are detected

DELAY=300 # needs to be 1 or 5 minute

run_script() {
    # Run the other script
    "$SCRIPT"

    notify-send 'BaseBrainy was synced'
}

run_script # run one time when opened script

while true; do
    # Wait for changes to occur
    inotifywait -r -e modify,create,delete,move "$DIR"

    # Wait for the specified delay
    sleep "$DELAY"

    run_script
done