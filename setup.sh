#!/bin/bash

echo "🚀 Starting Nexus CLI Full Setup..."
echo "==================================="

# 🧠 Ask user for swap size
echo ""
read -p "Enter desired SWAP size (8 or 10 GB): " SWAP_GB

if [[ "$SWAP_GB" != "8" && "$SWAP_GB" != "10" ]]; then
  echo "❌ Invalid input. Please enter 8 or 10."
  exit 1
fi

SWAP_MB=$((SWAP_GB * 1024))
SWAP_FILE="/swapfile"

echo "🛠️ Creating ${SWAP_GB}GB swap file at $SWAP_FILE..."

# Create swap file
sudo fallocate -l ${SWAP_MB}M $SWAP_FILE
sudo chmod 600 $SWAP_FILE
sudo mkswap $SWAP_FILE
sudo swapon $SWAP_FILE

# Make it persistent
echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab

# Confirm swap
echo "✅ Swap of ${SWAP_GB}GB created and activated."
swapon --show

# 📁 Create working dir
mkdir -p nexus-cli
cd nexus-cli

# 🧰 Install dependencies
echo ""
echo "📦 Installing required packages..."
sudo apt update
sudo apt install -y curl git pkg-config libssl-dev protobuf-compiler

# 🦀 Install Rust
echo ""
echo "🦀 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Load Rust into session
source "$HOME/.cargo/env"

# ➕ Add RISC-V target
echo "🔧 Adding RISC-V target..."
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
