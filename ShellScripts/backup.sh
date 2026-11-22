#!/bin/bash
# Author: Avisha Arora | Roll No: 2601730308
# Capstone Q2 - Backup Automation Script

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
LOG_FILE="$BACKUP_DIR/backup.log"

mkdir -p "$BACKUP_DIR"

if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
    SIZE=$(du -h "$BACKUP_FILE" | awk '{print $1}')
    echo "Backup created successfully: $BACKUP_FILE"
    echo "Backup size: $SIZE"
    echo "$TIMESTAMP - SUCCESS - $BACKUP_FILE - Size: $SIZE" >> "$LOG_FILE"
else
    echo "Error: Backup creation failed."
    echo "$TIMESTAMP - FAILED - $SOURCE" >> "$LOG_FILE"
    exit 1
fi
