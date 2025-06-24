#!/bin/bash

echo "[INFO] Starting Nexus CLI Cleanup..."
echo "==================================="

# 1. Remove nexus-cli directory
rm -rf "$HOME/nexus-cli"
echo "[OK] Removed ~/nexus-cli directory."

# 2. Disable and delete swap file
if grep -q "/swapfile" /etc/fstab; then
  echo "[INFO] Disabling and removing swap..."
  sudo swapoff /swapfile
  sudo sed -i '/\/swapfile/d' /etc/fstab
  sudo rm -f /swapfile
  echo "[OK] Swap file removed."
else
  echo "[SKIP] No swap file entry found in /etc/fstab."
fi

# 3. Remove Rust and cargo
echo "[INFO] Removing Rust..."
rm -rf "$HOME/.cargo" "$HOME/.rustup"
echo "[OK] Rust removed."

# 4. Remove Nexus CLI binary
echo "[INFO] Removing Nexus CLI..."
rm -rf "$HOME/.nexus"
echo "[OK] Nexus CLI removed."

# 5. Optional: Remove system packages
read -p "🧯 Remove installed system packages? (libssl-dev, pkg-config, protobuf-compiler, etc) [y/N]: " REMOVE_PKGS
if [[ "$REMOVE_PKGS" =~ ^[Yy]$ ]]; then
  sudo apt-get remove --purge -y pkg-config libssl-dev protobuf-compiler build-essential git curl
  sudo apt-get autoremove -y
  echo "[OK] System packages removed."
else
  echo "[SKIP] System package removal skipped."
fi

echo ""
echo "✅ Cleanup complete!"
echo "Need help? Contact 👉 https://t.me/Amit3701"
