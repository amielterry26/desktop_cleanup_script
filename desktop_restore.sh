#!/bin/bash

DESKTOP="$HOME/Desktop"
CLEANUP_BASE="$DESKTOP/Desktop Cleanup"

echo
echo "🌀 Desktop Restore Script"
echo "--------------------------"
read -p "Restore from today or another date? (t = today, o = other): " choice

# Determine date folder
if [[ "$choice" == "t" ]]; then
    RESTORE_DATE=$(date +"%Y-%m-%d")
else
    read -p "Enter date to restore from (format: YYYY-MM-DD): " RESTORE_DATE

    if [[ -z "$RESTORE_DATE" ]]; then
        echo "❌ Invalid date format or conversion failed."
        exit 1
    fi
fi

RESTORE_DIR="$CLEANUP_BASE/$RESTORE_DATE"
ALL_FILES_DIR="$RESTORE_DIR/All Files"

# Validate folder exists
if [[ ! -d "$ALL_FILES_DIR" ]]; then
    echo "❌ No 'All Files' folder found for $RESTORE_DATE."
    exit 1
fi

echo
echo "==> Restoring files from: $ALL_FILES_DIR"
sleep 0.2

count=0
for FILE in "$ALL_FILES_DIR"/*; do
    BASENAME=$(basename "$FILE")
    cp "$FILE" "$DESKTOP/$BASENAME"
    ((count++))
done

echo
echo "✅ Restored $count file(s) to Desktop."

# Optional: Delete cleanup folder for that date
read -p "Do you want to delete the '$RESTORE_DATE' cleanup folder? (y/n): " delete_choice
if [[ "$delete_choice" == "y" ]]; then
    rm -rf "$RESTORE_DIR"
    echo "🗑️  Deleted folder: $RESTORE_DIR"
else
    echo "📁 Kept folder: $RESTORE_DIR"
fi

# Log to history file
LOG_FILE="$CLEANUP_BASE/restore_log.txt"
echo "$(date +"%Y-%m-%d %H:%M:%S") - Restored from $RESTORE_DATE ($count file[s])" >> "$LOG_FILE"

echo
echo "📝 Restore logged to: $LOG_FILE"
echo "✅ Desktop restore complete."