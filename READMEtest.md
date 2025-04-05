# Desktop Cleanup Script

---

## Overview: 
This will be a script to organize all of the content on my desktop into a master folder (desktop_cleanup_files) and sub-folders (based on file type), for me to sort through and organize later into their proper locations.

## Objective :

#### Organize all of the content on my desktop into folders organize by extension/file type (.pdf, .md, .png) etc. in a seamless fashion. 
- ### MVP/Beta Version 1 (Folder creation script) : 
1. Create a folder on the desktop called "desktop_cleanup"
2. < cd > into that folder
3. create 3 sub-folders within the main directory (documents, media, other)
   4. documents : .pdf, .txt, .docx
   5. media : .png, .jpeg, .mp3, .mp4
   6. Other : all other file types
4. < cd > out of that folder (x2) back onto the main desktop.

---
### Workflow (Assuming you already have the script on your local machine)

1. Download script into your desired directory. 
   - (If you desire a truly/completely clean desktop, feel free do download it into a folder or subfolder stored elsewhere on your local machine).
2. Navigate from your current directory to the directory your script is in.

```bash
cd <path_to_directory>
```

2. Copy the script to your desktop: 
``` bash
cp  desktop_cleanup_script.sh <path_to_your_desktop>
```
3. Run script: 
``` bash
./desktop_cleanup_script.sh
```
<br>


## Optional:

---
If you want a completely clean desktop setup, run these two commands to:

   - **Remove directory:**
```bash
rm -rf desktop_cleanup
```
   - **Remove script:**
```bash
rm -rf desktop_cleanup_script.sh
```