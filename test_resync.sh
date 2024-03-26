PATH1="$HOME/Documents/BaseBrainy/"
PATH2="remote:BaseBrainy/"

rclone bisync "$PATH1" "$PATH2" --resync --create-empty-src-dirs --verbose --dry-run # --create-empty-s    rc-dirs means "sync empty dirs too". --verbose means "show whats going on"

