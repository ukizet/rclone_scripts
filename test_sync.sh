PATH1="$HOME/Documents/BaseBrainy/"  
PATH2="remote:BaseBrainy/"

rclone bisync "$PATH1" "$PATH2" --create-empty-src-dirs --verbose --dry-run # --create-empty-src-dirs     means "sync empty dirs too". --verbose means "show whats going on"
#rclone bisync "$PATH1" "$PATH2" --create-empty-src-dirs --verbose --exclude .obsidian/ # --c    reate-empty-src-dirs means "sync empty dirs too". --verbose means "show whats going on"

