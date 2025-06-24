#!/bin/bash

echo "[INFO] Starting Nexus CLI Full Setup..."
echo "======================================="

# Prompt for swap size
read -p "Enter desired SWAP size (8 or 10 GB): " SWAP_GB

if [[ "$SWAP_GB" != "8" && "$SWAP_GB" != "10" ]]; then
  echo "[ERROR] Invalid input. Please enter 8 or 10."
  exit 1
fi

# Create swap
echo "[INFO] Creating ${SWAP_GB}GB swap file..."
sudo fallocate -l ${SWAP_GB}G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo "[OK] Swap file created and activated."

# Create project dir
mkdir -p ~/nexus-cli
cd ~/nexus-cli

# Install dependencies
echo "[INFO] Installing system packages..."
sudo apt-get update -y
sudo apt-get install -y pkg-config libssl-dev protobuf-compiler build-essential git curl

# Install Rust
echo "[INFO] Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Add RISC-V target
rustup target add riscv32i-unknown-none-elf

# ⬇️ Install Nexus CLI
echo ""
echo "⬇️ Downloading and running Nexus CLI installer..."
curl https://cli.nexus.xyz/ | sh

echo ""
echo "✅ Setup Complete!"
echo "Visit https://beta.nexus.xyz to get your Node ID."
echo "To restart later: curl https://cli.nexus.xyz/ | sh"

echo ""
echo "🙏 Thank you for using this setup!"
echo "Need help? Contact 👉 https://t.me/Amit3701"
