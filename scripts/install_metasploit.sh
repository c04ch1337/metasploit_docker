#!/bin/bash
echo "[+] Updating and installing Metasploit..."
sudo apt update && sudo apt install -y metasploit-framework
msfdb init
echo "[+] Metasploit installed and database initialized!"
