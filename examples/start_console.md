## 📜 start_console.sh

## Purpose:
Launch the Metasploit Console (msfconsole) in a convenient way, possibly as part of a startup script or lab automation.

### Script:
```bash
#!/bin/bash

echo "[+] Launching Metasploit Console..."
msfconsole
```
---

### What it does:

    Simply prints a message

    Starts the msfconsole, which is the main interface for using the framework

### Why you need it:

    Useful for Docker containers or lab automation (e.g., provisioning scripts)

    Ensures a consistent entrypoint if you're bundling this into scripts, aliases, or other toolchains

### How to use it:
```bash
chmod +x start_console.sh
./start_console.sh
```
