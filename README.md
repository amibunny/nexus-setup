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
----
🧾 After Setup
Visit https://beta.nexus.xyz

Go to the Node section

Copy your Node ID

Paste it into the CLI when prompted

----

🔁 Restarting Nexus CLI
To restart Nexus CLI later, run:

```
curl https://cli.nexus.xyz/ | sh
```

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
🙏 Thank You
Thank you for using this setup!
Need help? Contact 👉 https://t.me/Amit3701
-----
