# 🖥️ doineedtoupgrade (macOS)

A readable Bash script that shows you your Mac’s current system info — like memory, CPU, disk space, macOS version, and battery — in plain, human-friendly language.

Made for curious users, engineers, and makers who want quick clarity without digging through technical menus.

---

## 📦 What's Included

- `system_info.sh`: A lightweight script that displays your Mac’s hardware, software, and power status in grouped sections with clean output.

---

## 🛠️ How It Works

When you run the script, it pulls information directly from macOS system commands and presents it in clearly labeled categories:

- **Hardware**: RAM, CPU, and Mac model
- **Storage**: Disk space used and available
- **Software**: macOS version and uptime
- **Network**: Logged-in user and IP address
- **Power**: Battery percentage and charging status

No dependencies. No configuration. Just info.

---

## ⚙️ How to Use

1. Download the script:
   - `system_info.sh`

2. Make it executable:
   ```bash
   chmod +x system_info.sh
   ```

3. Run the script:
   ```bash
   ./system_info.sh
   ```

---

## 🧾 Example Output

```
===============================
🖥️  BASIC MAC SYSTEM INFO
===============================

🔧 Hardware:
  🧠 Memory (RAM):         16 GB
  ⚙️  Processor (CPU):      Apple M1 Pro
  💻 Mac Model Identifier: MacBookPro18,3

💽 Storage:
  📦 Disk Space:
    Total:     494 GB
    Used:      210 GB
    Available: 284 GB

🧾 Software:
  macOS Version: 13.6.1
  ⏱️  Uptime:       2 days, 5:23

🌐 Network:
  👤 Current User:    amiel
  🌍 Local IP Address: 192.168.1.24

🔋 Power:
  Battery: 84% (charging)

===============================
```

---

## 🔁 If Something Goes Wrong

No system changes are made — this is read-only. If anything looks off, you can simply re-run the script or review it before use. It’s yours to modify, expand, and learn from.

---

### 🧙🏾‍♂️‍ Created by [Amiel Terry](https://amielterry.me) & Arcane Systems LLC
