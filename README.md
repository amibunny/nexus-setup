# 🚀 Nexus CLI One-Click Installer

---
## 💻 Recommended System Requirements

These are the ideal specs for running and building Nexus CLI on a VPS or development server:
-------------------------------------------------------------------------------
| Component     | Recommended        | Notes                                  |
|---------------|--------------------|----------------------------------------|
| CPU           | 2+ vCPU            | For faster compilation and performance |
| RAM           | 8+ GB              | Required for Rust builds               |
| Swap          | 8–10 GB            | Script helps configure this            |
| Disk Space    | 10+ GB             | Needed for builds, cache, and logs     |
| Internet      | Stable connection  | Needed for CLI sync and downloads      |
-------------------------------------------------------------------------------
> ✅ **Recommended VPS**: Ubuntu 22.04 LTS with at least **2 vCPU, 8 GB RAM, and 10 GB disk**


---

This script sets up the Nexus CLI with required dependencies and an optional 8GB or 10GB swap file on Ubuntu-based systems.

---
## First Run this Two Command To avoid error 
First : Install Bash 
```
sudo apt install bash -y
```
Second : Install Curl 
```
sudo apt install curl -y
```
## 🧪 One-Click Setup (Swap File Included)

Run one of the following in your terminal:

### ▶️ 8GB Swap Setup
```bash
echo "8" | bash <(curl -sSL https://raw.githubusercontent.com/amibunny/nexus-setup/main/setup.sh)
```
### ▶️ 10GB Swap Setup
```bash
echo "10" | bash <(curl -sSL https://raw.githubusercontent.com/amibunny/nexus-setup/main/setup.sh)
```
press : y
----
🧾 After Setup
Visit https://app.nexus.xyz/nodes

Go to the Node section

click on + Add CLI Node

Copy your Node ID

Paste it into the CLI when prompted

----
## 🖥️ Run in Background with Screen (VPS Recommended)
Install and use screen to keep Nexus running even after logout:

```
sudo apt install screen -y
```
Create screen
```
screen -S nexus
```
To deatch screen press crtl + A then D

To re-attach:
```
screen -r nexus
```

## Start nexus using this command 
```
nexus-network start --node-id <your-node-id>
```
for example 

nexus-network start --node-id 123456


----

🔁 Restart Nexus CLI
To restart Nexus CLI later, run:

```
nexus-network start --node-id <your-node-id>
```
---
## 💰 Claiming Your NEX Rewards
    Once your Nexus CLI node is running and earning points, you can convert your points into Testnet NEX tokens.

  - 👉 Go to the rewards page:
    https://app.nexus.xyz/rewards

  - 🧮 Conversion Rate: 1000 points = 1 NEX

  - 📝 Click on "Claim Testnet NEX" on the right side of the page.
    All available points will be converted into NEX automatically.


---
## 📦 What This Script Does

This script prepares your environment to run Nexus CLI smoothly by:

- 📁 Creates a working directory: `nexus-cli`
- 💾 Sets up **swap memory** (8GB or 10GB based on your choice)
- 🦀 Installs **Rust** using the official rustup installer
- 🎯 Adds the **RISC-V** target: `riscv32i-unknown-none-elf`
- 📦 Installs system dependencies: `pkg-config`, `libssl-dev`, `protobuf-compiler`
- 🚀 Installs and runs the official **Nexus CLI**
- ✅ Guides you to configure your Node ID from [https://beta.nexus.xyz](https://beta.nexus.xyz)

---
## 🧹 Uninstall Script
If you want to completely remove all installed components (Nexus CLI, Rust, swap file, dependencies):

```
bash <(curl -sSL https://raw.githubusercontent.com/amibunny/nexus-setup/main/delete.sh)
```
---
🙏 Thank You
Thank you for using this setup!
Need help? Contact 👉 https://t.me/Amit3701
-----
