#!/bin/bash

# Set directories
DESKTOP="$HOME/Desktop"
CLEANUP_DIR="$DESKTOP/Desktop Cleanup"
DOCS_DIR="$CLEANUP_DIR/Documents"
MEDIA_DIR="$CLEANUP_DIR/Media"
OTHER_DIR="$CLEANUP_DIR/Other"

echo
echo "==> Checking for Desktop Cleanup folder..."
sleep 0.05

# Create directories if they don't exist
if [[ ! -d "$CLEANUP_DIR" ]]; then
    echo "No Desktop Cleanup folder detected. Creating structure..."
else
    echo "Desktop Cleanup folder already exists. Skipping creation."
fi
mkdir -p "$DOCS_DIR" "$MEDIA_DIR" "$OTHER_DIR"
sleep 0.05

# Initialize counters and size trackers
docs_count=0
media_count=0
other_count=0

docs_size=0
media_size=0
other_size=0

# Prepare grouped logs
docs_log=""
media_log=""
other_log=""

echo
echo "==> Scanning Desktop files and transferring..."
sleep 0.05

# Loop through files on Desktop
for FILE in "$DESKTOP"/*; do
    FILENAME=$(basename "$FILE")
    
    # Skip folders, the cleanup folder, and this script or restore script
    if [[ -d "$FILE" || "$FILE" == "$CLEANUP_DIR" || "$FILENAME" == "desktop_cleanup.sh" || "$FILENAME" == "desktop_restore.sh" ]]; then
        continue
    fi

    EXT="${FILENAME##*.}"
    SIZE_BYTES=$(stat -f%z "$FILE")
    SIZE_MB=$(echo "scale=2; $SIZE_BYTES / 1024 / 1024" | bc)

    # Route file based on extension
    case "$EXT" in
        pdf|doc|docx|txt|xlsx|xls|ppt|pptx)
            mv "$FILE" "$DOCS_DIR/$FILENAME"
            docs_log+=$'\n'"Moved $FILENAME to Documents (${SIZE_MB} MB)"
            sleep 0.05
            ((docs_count++))
            docs_size=$(echo "$docs_size + $SIZE_MB" | bc)
            ;;
        jpg|jpeg|png|gif|mp4|mov|avi|mp3|wav)
            mv "$FILE" "$MEDIA_DIR/$FILENAME"
            media_log+=$'\n'"Moved $FILENAME to Media (${SIZE_MB} MB)"
            sleep 0.05
            ((media_count++))
            media_size=$(echo "$media_size + $SIZE_MB" | bc)
            ;;
        *)
            mv "$FILE" "$OTHER_DIR/$FILENAME"
            other_log+=$'\n'"Moved $FILENAME to Other (${SIZE_MB} MB)"
            sleep 0.05
            ((other_count++))
            other_size=$(echo "$other_size + $SIZE_MB" | bc)
            ;;
    esac
done

# Display grouped logs
echo
echo "========== RESULTS =========="
echo
echo "Documents:"
echo "$docs_log"
echo
echo "Media:"
echo "$media_log"
echo
echo "Other:"
echo "$other_log"
echo

# Final Summary
echo "========== SUMMARY =========="
echo "Documents: $docs_count file(s), ${docs_size} MB"
echo "Media:     $media_count file(s), ${media_size} MB"
echo "Other:     $other_count file(s), ${other_size} MB"
echo
echo "Desktop cleanup complete."
