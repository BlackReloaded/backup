#!/bin/bash

TARGET="${TARGET:-/root/backups}"
OLD="${OLD:-6M}"

cleanup() {
    echo "Cleanup rdiff-backup"
    for src in $(echo $BACKUPS | tr ";" "\n"); do
        dst="${src/::/}"
        echo "Cleanup backup source $src to $TARGET/$dst"
        rdiff-backup --remove-older-than $OLD "$TARGET/$dst"
    done
    echo "Cleanup complete"
}

create() {
    echo "Creating backup"
    for src in $(echo $BACKUPS | tr ";" "\n"); do
        dst="${src/::/}"
        echo "Backup source $src to $TARGET/$dst"
        rdiff-backup --print-statistics $src "$TARGET/$dst"
        echo "Done"
    done
    echo "backup complete"
}

case "$1" in
    cleanup)
        cleanup
        ;;
    create)
        create
        ;;
    *)
        echo "usage $0 cleanup|create"
esac
exit
