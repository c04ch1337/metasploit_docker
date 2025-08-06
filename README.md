<h1 align="center">
  <img src="https://www.metasploit.com/includes/images/metasploit-logo-light-external-use.svg"/><br>
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
