# Desktop Cleanup Script (macOS)

A simple Bash script that organizes your messy macOS Desktop into categorized folders: `Documents`, `Media`, and `Other`. Designed for engineers, makers, and tinkerers who love clean output and satisfying automation.

---
## 📦 What's Included

- `desktop_cleanup.sh`: Sorts files on your Desktop into subfolders inside `Desktop Cleanup`.
- `desktop_restore.sh`: Restores all files from the subfolders back to your Desktop.

---

## 🛠️ How It Works

The script checks for a folder called `Desktop Cleanup`. If it doesn't exist, it creates it — along with three subdirectories:

- `Documents`: `.pdf`, `.docx`, `.txt`, `.xlsx`, etc.
- `Media`: `.jpg`, `.png`, `.mp4`, `.mp3`, etc.
- `Other`: Anything else

Each file on your Desktop is moved into the appropriate folder based on its extension.

---

## ⚙️ How to Use

1. **Download both scripts**:
    - `desktop_cleanup.sh`
    - `desktop_restore.sh`

2. Place them on your **Desktop**.

3. Make them executable:
   ```bash
   chmod +x ~/Desktop/desktop_cleanup.sh
   chmod +x ~/Desktop/desktop_restore.sh
   ```

4. Run the cleanup script:
   ```bash
   ~/Desktop/desktop_cleanup.sh
   ```

---

## 🧾 Example Output

```
==> Checking for Desktop Cleanup folder...
No Desktop Cleanup folder detected. Creating structure...

==> Scanning Desktop files and transferring...

========== RESULTS ==========

Documents:
Moved resume.docx to Documents (0.32 MB)

Media:
Moved photo.png to Media (1.21 MB)

Other:
Moved debug.log to Other (0.01 MB)

========== SUMMARY ==========
Documents: 1 file(s), 0.32 MB
Media:     1 file(s), 1.21 MB
Other:     1 file(s), 0.01 MB

Desktop cleanup complete.
```

---

## 🔁 If Something Goes Wrong

If the cleanup didn’t work how you expected — no worries.

Just run:
```bash
~/Desktop/desktop_restore.sh
```

It will move everything back to your Desktop and ask if you want to delete the cleanup folder.

---

### 🧙🏾‍♂️‍ Created by [Amiel Terry](https://amielterry.me) & Arcane Systems LLC

