# Setting Up MPCWallet for Development (Linux)

This guide covers the setup process for Linux users, including a fix for environments where `snap` is not available.

## Prerequisites
- Git
- Python (for script-based tasks)
- Flutter SDK

## Manual Flutter Installation (Non-Snap Method)
If `sudo snap install flutter` fails with `snap: command not found`, follow these steps:

1. **Install dependencies:**
   `sudo apt update && sudo apt install -y curl git unzip xz-utils zip libglu1-mesa`
2. **Clone Flutter SDK:**
   `mkdir ~/development && cd ~/development`
   `git clone https://github.com/flutter/flutter.git -b stable`
3. **Add to PATH:**
   Add `export PATH="$PATH:$HOME/development/flutter/bin"` to your `~/.bashrc` file.
4. **Refresh Bash:**
   `source ~/.bashrc`

## Initializing the Project
Once Flutter is installed, run:
```bash
flutter pub get
