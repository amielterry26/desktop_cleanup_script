# Desktop Cleanup Script (macOS)

This Bash script organizes files on your Mac Desktop into categorized folders based on file type. It helps keep your workspace clean while offering a simple restore script to undo changes.

---

## Features

- Moves files into a `Desktop Cleanup` folder with subfolders:
    - `Documents` — PDF, Word, Excel, PowerPoint, and text files
    - `Media` — Images, audio, video files
    - `Other` — Everything else
- Calculates file sizes in MB
- Skips itself (`desktop_cleanup.sh`), the restore script (`desktop_restore.sh`), and the cleanup folder
- Logs grouped results by file type with a final summary

---

## Scripts Included

### `desktop_cleanup.sh`

Organizes all files from your Desktop into `Desktop Cleanup/Documents`, `Media`, and `Other`.

### `desktop_restore.sh`

Restores files from the `Desktop Cleanup` folder back to their original location on the Desktop.

---

## How to Use

### Step 1: Download the Scripts

Place both of these scripts directly on your Mac Desktop:

- `desktop_cleanup.sh`
- `desktop_restore.sh`

### Step 2: Make Them Executable

Open Terminal and run:

```bash
chmod +x ~/Desktop/desktop_cleanup.sh
chmod +x ~/Desktop/desktop_restore.sh
```

### Step 3: Run the Cleanup Script

```bash
~/Desktop/desktop_cleanup.sh
```

### Step 4: Restore (If Needed)

```bash
~/Desktop/desktop_restore.sh
```

> **Note:** These scripts will not move themselves. They are always left on your Desktop for easy access.

---

## Example Output

```
========== RESULTS ==========

Documents:
Moved report.docx to Documents (1.23 MB)
Moved notes.txt to Documents (0.75 MB)

Media:
Moved vacation.jpg to Media (2.01 MB)

Other:
Moved setup.sh to Other (0.30 MB)

========== SUMMARY ==========
Documents: 2 file(s), 1.98 MB
Media:     1 file(s), 2.01 MB
Other:     1 file(s), 0.30 MB

Desktop cleanup complete.
```

---

## Disclaimer

This script **moves files** from your Desktop into categorized folders. No files are deleted. Always test responsibly.

---

## License

MIT License — use freely, modify responsibly.

---

## Author

Crafted with obsessive attention to detail by 🧙🏾‍♂️‍ [Amiel Terry](https://amielterry.me) & Arcane Systems LLC