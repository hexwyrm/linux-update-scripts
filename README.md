# Unified Linux Update Scripts

A collection of simple Bash scripts to automate system updates across multiple Linux distributions.  
These scripts handle package upgrades, cleanup, Flatpak updates, Snap updates, and firmware updates — 
all in one command.

## ✨ Features
- Runs the native package manager for each distro:
  - **Fedora** → `dnf`
  - **Arch-based (RebornOS, Manjaro, etc.)** → `pacman`
  - **Debian-based (Mint, Debian, Kali, Ubuntu, etc.)** → `apt`
- Cleans up unused dependencies (`autoremove` or equivalent).
- Updates **Flatpak** packages.
- Updates **Snap** packages.
- Updates system **firmware** via `fwupd`. (You will need fwupd installed if you want to use this feature)
- Automatically reboots if a firmware update requires it.

## 🚀 Usage
```bash
# 1. Clone the repository
git clone https://github.com/hexwyrm/linux-update-scripts.git
cd linux-update-scripts

# 2. Make the script executable
chmod +x FedoraUpdate.sh

# 3. Run the script
./FedoraUpdate.sh
 OR -
bash FedoraUpdate.sh
# This command requires being in the same directory in the terminal as where the file is located)

----------------------------------------------------------------------------------------------------------

# ⚠️ Note:
# These scripts use sudo for package management and firmware updates.
# You will be prompted for your password.

## 📜 License

This project is licensed under the **PolyForm Noncommercial License 1.0.0**.

Commercial use requires separate permission from the copyright holder.

See the `LICENSE` file for the full license terms.

**Required Notice: Copyright 2026 Hexwyrm**
