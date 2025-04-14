#!/bin/bash

# Set base directories
DESKTOP="$HOME/Desktop"
CLEANUP_BASE="$DESKTOP/Desktop Cleanup"
TODAY=$(date +"%Y-%m-%d")
RUN_DIR="$CLEANUP_BASE/$TODAY"
ORG_DIR="$RUN_DIR/Organized"
ALL_DIR="$RUN_DIR/All Files"

# Create directory structure
echo
echo "==> Setting up folder structure for today's cleanup..."
mkdir -p "$ORG_DIR/Documents" "$ORG_DIR/Media" "$ORG_DIR/Other" "$ALL_DIR"

# Initialize counters and size trackers
docs_count=0; media_count=0; other_count=0
docs_size=0; media_size=0; other_size=0
docs_log=""; media_log=""; other_log=""

echo
echo "==> Scanning Desktop files and transferring..."
sleep 0.05

# Loop through files on Desktop
for FILE in "$DESKTOP"/*; do
    FILENAME=$(basename "$FILE")

    # Skip self, restore script, and cleanup folder
    if [[ -d "$FILE" || "$FILE" == "$CLEANUP_BASE" || "$FILENAME" == "desktop_cleanup.sh" || "$FILENAME" == "desktop_restore.sh" ]]; then
        continue
    fi

    EXT="${FILENAME##*.}"
    SIZE_BYTES=$(stat -f%z "$FILE")
    SIZE_MB=$(echo "scale=2; $SIZE_BYTES / 1024 / 1024" | bc)

    case "$EXT" in
        pdf|doc|docx|txt|xlsx|xls|ppt|pptx|csv)
            mv "$FILE" "$ORG_DIR/Documents/$FILENAME"
            cp "$ORG_DIR/Documents/$FILENAME" "$ALL_DIR/$FILENAME"
            docs_log+=$'\n'"Moved $FILENAME to Documents (${SIZE_MB} MB)"
            ((docs_count++))
            docs_size=$(echo "$docs_size + $SIZE_MB" | bc)
            ;;
        jpg|jpeg|png|gif|mp4|mov|avi|mp3|wav)
            mv "$FILE" "$ORG_DIR/Media/$FILENAME"
            cp "$ORG_DIR/Media/$FILENAME" "$ALL_DIR/$FILENAME"
            media_log+=$'\n'"Moved $FILENAME to Media (${SIZE_MB} MB)"
            ((media_count++))
            media_size=$(echo "$media_size + $SIZE_MB" | bc)
            ;;
        *)
            mv "$FILE" "$ORG_DIR/Other/$FILENAME"
            cp "$ORG_DIR/Other/$FILENAME" "$ALL_DIR/$FILENAME"
            other_log+=$'\n'"Moved $FILENAME to Other (${SIZE_MB} MB)"
            ((other_count++))
            other_size=$(echo "$other_size + $SIZE_MB" | bc)
            ;;
    esac

    sleep 0.05
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
echo "Files have been moved to:"
echo "Organized:  $ORG_DIR"
echo "All Files:  $ALL_DIR"
echo
echo "✅ Desktop cleanup complete for $TODAY."